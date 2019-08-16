class AttendancesController < ApplicationController

	def create
		@event = Event.find(params[:event_id])
		@amount = @event.price

		  customer = Stripe::Customer.create({
		    email: params[:stripeEmail],
		    source: params[:stripeToken],
		  })

		  charge = Stripe::Charge.create({
		    customer: customer.id,
		    amount: @amount,
		    description: "Participation a l'évènement n°#{@event.id} par #{current_user.username}",
		    currency: 'eur'
		  })

		@attendance = Attendance.new(event_id: params[:event_id], attendant: current_user, stripe_customer_id: customer.id)
			if @attendance.save
				flash[:success] = "Participation is validate !"
				redirect_to event_path(@event.id)
			end
			
		rescue Stripe::CardError => e
		  flash[:error] = e.message
		  redirect_to new_charge_path

	end

	def destroy
		@attendance = Attendance.find_by(event_id: params[:event_id], attendant: current_user)
		@attendance.destroy
  	redirect_to event_path(params[:event_id])
	end
end
