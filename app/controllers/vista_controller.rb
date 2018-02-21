class VistaController < ApplicationController

  def index
    @contrato = Contrato.where("id="+request[:id]).first

    if request[:accion]
      if request[:accion]=="Presentar" or request[:accion]=="Aprobar"
        @contrato.estado = @contrato.estado + 1
        email(@contrato, 1)
      elsif request[:accion]=="Rechazar"
        @contrato.estado = @contrato.estado - 1
        email(@contrato, 2)
      end
      puts @contrato
      @contrato.save()
    end

    @cuotas = Cuota.where("contrato_id = "+request[:id])
  end

  def save
    @contrato = Contrato.where("id="+request[:id])
    if request[:accion]=="Presentar" or request[:accion]=="Aprobar"
      @contrato.estado = @contrato.estado + 1
    elsif request[:accion]=="Rechazar"
      @contrato.estado = @contrato.estado + 1
    end
    puts @contrato
    @contrato.save()
    redirect_to url_for(:controller => 'vista', :action => 'index', :id => 9863)
  end


  def email(contrato, aceptado)
    subject = "PRUEBA ANDRES TARRIO - El contrato "+contrato.id.to_s

    if aceptado == 2
      subject = subject + " fue rechazado "
    end


    if contrato.estado == 2
      @usuarios_adm = User.where("estado = 1 and perfil_id = 3")
      subject = subject + " requiere de su revision "
    elsif contrato.estado == 3
      @usuarios_adm = User.where("id = "+contrato.autoridad_id.to_s)
      subject = subject + "  requiere de su revision "
    elsif contrato.estado == 4
      @usuarios_adm = User.where("estado = 1 and perfil_id = 5")
      subject = subject + "  requiere de su revision "
    elsif contrato.estado == 5
      @usuarios_adm = User.where("id = "+contrato.usuarios_id.to_s)
      subject = subject + "  requiere de su revision "
    end

    email = "Para acceder al contrato haga ingrese al siguiente link http://contratos.frgp.utn.edu.ar/vista/"+contrato.id.to_s+""

    mails = []
    begin
    @usuarios_adm.each do |u|
      begin
       mails.push(u.email)
      rescue
        puts "Error"
      end
    end
    rescue
     puts "Error"
    end

    to = mails.join(", ").to_s

begin

  puts to
  puts subject
  puts email

    @result = HTTParty.post('http://127.0.0.1:8081/post',
                            :body => { :to => to,
                                       :subject => subject,
                                       :email => email,
                            }.to_json,
                            :headers => { 'Content-Type' => 'application/json' } )

rescue
  puts "Error"
end

  end

end
