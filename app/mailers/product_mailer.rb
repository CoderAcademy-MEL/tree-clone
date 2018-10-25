class ProductMailer < ApplicationMailer
  def new_purchase
    @user = params[:user]
    @product = params[:product]
    mail(to: @user.email, subject: 'Congratulations on your purchase')
  end
end
