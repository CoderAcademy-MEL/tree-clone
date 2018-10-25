class ProductMailer < ApplicationMailer
  def new_purchase
    @user = params[:user]
    mail(to: @user.email, subject: 'Congratulations on your purchase')
  end
end
