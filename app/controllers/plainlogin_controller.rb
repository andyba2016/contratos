class PlainloginController < ApplicationController
  layout "external_pages", except: [:index, :faqs]

  def about_us
  end

  def team
  end

  def faqs
    #renders with views/layouts/application.html.erb
  end
end
