class SessionsController < ApplicationController

  def new

  end

  def create
    student = Student.find_by(email: params[:session][:email].downcase)
    if student && student.authenticate(params[:session][:password])
      # Sign the user in and redirect to the user's show page.
      sign_in student
      redirect_to student
    else
      # Create an error message and re-render the signin form.
      flash.now[:error] = 'Invalid email/password combination' # Not quite right!
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to events_path
  end
end
