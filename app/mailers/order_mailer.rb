class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def new_order(current_user, body, phone_number, color, post)
  	@current_user = current_user
  	@body = body
  	@post = post
    @phone_number = phone_number
    @color = color
	mail(to: "joingamings@gmail.com",
		 from: "forumjankenpon@gmail.com",
		 subject: "Заказ"
		 )
  end

 def buy_more(current_user)
 	@current_user = current_user
 		mail(to: current_user.email,
		 from: "forumjankenpon@gmail.com",
		 subject: "Заказ"
		 )
 end

end
