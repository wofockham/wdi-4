class PagesController < ApplicationController
  def index
  end

  def contact
  end

  def sendemail
    ContactMailer.contact_email(params[:email], params[:message]).deliver
  end
end
