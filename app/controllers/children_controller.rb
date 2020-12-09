class ChildrenController < ApplicationController
  before_action :set_child, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /children
  def index
    @children = Child.where user: @user.id

    render json: @children
  end

  # GET /children/1
  def show
    render json: @child
  end

  # POST /children
  def create
    @child = Child.new(child_params)
    @child.user = @user

    if @child.save
      render json: @child, status: :created, location: @child
    else
      render json: @child.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /children/1
  def update
    if @child.update(child_params)
      render json: @child
    else
      render json: @child.errors, status: :unprocessable_entity
    end
  end

  # DELETE /children/1
  def destroy
    @child.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_child
      @child = Child.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def child_params
      params.require(:child).permit(:name, :dob, :gender, :user_id)
    end
end
