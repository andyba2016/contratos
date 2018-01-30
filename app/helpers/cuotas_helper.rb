module CuotasHelper

  def generate(contrato_id)
    @contrato = Contrato.where("id="+contrato_id.to_s).first
    Cuota.where("contrato_id = "+contrato_id.to_s).destroy_all
    date2 =@contrato.fecha_hasta.to_date
    date1 = @contrato.fecha_desde.to_date
    meses =((date2.year * 12 + date2.month) - (date1.year * 12 + date1.month))
    if ((meses).to_int > 0)
      (0..meses ).each do |i|
        @cuota = Cuota.new()
        @cuota.mes = i
        @cuota.horas_semanales = @contrato.horas_semanales
        @cuota.horas_mensuales = @contrato.horas_semanales.to_i * 4
        @cuota.valor_hora = @contrato.valor_hora
        @cuota.valor_cuota = @cuota.horas_mensuales.to_i * @cuota.valor_hora.to_f
        @cuota.valor_letras = @cuota.valor_cuota.to_words
        @cuota.contrato_id = contrato_id
        @cuota.fecha = (date1 + i.month).to_date.strftime("%m/%Y")
        @cuota.save()
      end
    end
  end
end