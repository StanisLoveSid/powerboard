class OrdersController < ApplicationController
 



  # POST /orders
  # POST /orders.json




  def create
    @post = Post.find(params[:post_id])
    @order = @post.orders.new(order_params)

    

    if user_signed_in?

    respond_to do |format|
      if @order.save
        OrderMailer.new_order(current_user, @order.body, @order.phone_number, @order.color, @post).deliver
        OrderMailer.buy_more(current_user).deliver
        format.html { redirect_to @post, notice: 'Заказ успешно создан. Вскоре мы перезвоним Вам' }
        format.json 
        format.js
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
        format.js
      end
    end
  else
    respond_to do |format|
   format.html {redirect_to new_user_registration_path, notice: 'You have to sign in or sign up to leave orders'}
   end
  end

  end

  def destroy

    @orders = Order.all
    @order.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'order was successfully destroyed.' }
      format.json { head :no_content }
      format.js
    end
  end


  # DELETE /orders/1
  # DELETE /orders/1.json


 def index
  @orders = Order.all
 end




  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:post_id, :body, :user_id, :color, :phone_number)
    end
end
