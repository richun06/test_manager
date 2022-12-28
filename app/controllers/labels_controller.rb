class LabelsController < ApplicationController
  def index
    @labels = Label.where(user_id: current_user.id)
  end

  def new
    @label = Label.new
  end

  def create
    @label = Label.new(label_params)
    @label.user_id = current_user.id
    if @label.save
      redirect_to labels_path
    else
      render :new
    end
  end

  private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end

end
