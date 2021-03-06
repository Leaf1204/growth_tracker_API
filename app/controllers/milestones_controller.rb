class MilestonesController < ApplicationController
  before_action :set_milestone, only: [:show, :update, :destroy]
  before_action :authorized

  # GET /milestones
  def index
    @milestones = Milestone.all

    render json: @milestones.to_json(include: :child)
  end

  # GET /milestones/1
  def show
    render json: @milestone
  end

  # POST /milestones
  def create
    
    @milestone = Milestone.new(milestone_params)
    child_id = params['childid']
    @child = Child.find(child_id)
    @milestone.child = @child
    

    if @milestone.save
      render json: @milestone, status: :created, location: @milestone
    else
      render json: @milestone.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /milestones/1
  def update
    # child_id = params['childid']
    # @child = Child.find(child_id)
    # @milestone.child = @child
    if @milestone.update(milestone_params)
      render json: @milestone
    else
      render json: @milestone.errors, status: :unprocessable_entity
    end
  end

  # DELETE /milestones/1
  def destroy
    @milestone.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_milestone
      @milestone = Milestone.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def milestone_params
      params.require(:milestone).permit(:dateOf, :weight, :note)
    end
end
