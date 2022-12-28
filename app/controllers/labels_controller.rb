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

  def edit
    @label = Label.find(params[:id])
    if @label.user_id == current_user.id
      render "edit"
    else
      redirect_to labels_path
    end
  end

  def update
    @label = Label.find(params[:id])
    if @label.update(label_params)
      redirect_to labels_path, notice: "ラベル名を編集しました"
    else
      render :edit
    end
  end

  def destroy
    @label = Label.find(params[:id])
    if @label.user_id == current_user.id
      @label.destroy
      redirect_to labels_path, notice: "ラベルを削除しました"
    else
      redirect_to labels_path
    end
  end


  private

  def label_params
    params.require(:label).permit(:name, :user_id)
  end

end
