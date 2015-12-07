class GoalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_goal, only: [:show, :edit, :update, :destroy]

  # GET /goals
  # GET /goals.json
  def index
    @goals = current_user.goals
    @friend_goals = Goal.where("user_id" => current_user.friends.ids).where(private: false)
  end

  # GET /goals/1
  # GET /goals/1.json
  def show
    @goal_data = []
    dcount = count = current_user.results.learned.where("created_at < ?",  @goal.created_at.to_date).count
    current = current_user.results.learned.where("created_at >= ?",  @goal.created_at.to_date).where("created_at <= ?",  @goal.deadline.to_date)
      .group_by_day(:created_at).count.each_with_object({}){|(k,v),o| o[k.to_date]= count += v}
    
    if (@goal.user_id != current_user.id)
      udcount = ucount = @goal.user.results.learned.where("created_at < ?",  @goal.created_at.to_date).count
      user_goal = @goal.user.results.learned.where("created_at >= ?",  @goal.created_at.to_date).where("created_at <= ?",  @goal.deadline.to_date)
        .group_by_day(:created_at).count.each_with_object({}){|(k,v),o| o[k.to_date]= ucount += v}
    end
    
    avg = (@goal.goal / (@goal.deadline.to_date - @goal.created_at.to_date + 1)).to_f
    target = {}
    
    (@goal.created_at.to_date..@goal.deadline.to_date).each {|day|
      target[day] = (avg*(day - @goal.created_at.to_date + 1)).round(2)
      if day == @goal.created_at.to_date
        current[day] = dcount if current[day].nil?
      elsif day <= Time.now.to_date
        current[day] = current[day-1.days] if current[day].nil?
      end
      if (@goal.user_id != current_user.id)
        if day == @goal.created_at.to_date
          user_goal[day] = udcount if user_goal[day].nil?
        elsif day <= Time.now.to_date
          user_goal[day] = user_goal[day-1.days] if user_goal[day].nil?
        end
      end
    }
    @goal_data << {name: "current", data: current}
    if (@goal.user_id != current_user.id)
      @goal_data << {name: @goal.user.name, data: user_goal}
    end
    @goal_data << {name: "goal", data: target}
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/edit
  def edit
  end

  # POST /goals
  # POST /goals.json
  def create
    @goal = Goal.new(goal_params)
    respond_to do |format|
      if @goal.save
        format.html { redirect_to @goal, notice: 'Goal was successfully created.' }
        format.json { render :show, status: :created, location: @goal }
      else
        format.html { render :new }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goals/1
  # PATCH/PUT /goals/1.json
  def update
    respond_to do |format|
      if @goal.update(goal_params)
        format.html { redirect_to @goal, notice: 'Goal was successfully updated.' }
        format.json { render :show, status: :ok, location: @goal }
      else
        format.html { render :edit }
        format.json { render json: @goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goals/1
  # DELETE /goals/1.json
  def destroy
    @goal.destroy
    respond_to do |format|
      format.html { redirect_to goals_url, notice: 'Goal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def goal_params
      params.require(:goal).permit(:goal, :deadline, :user_id, :title, :private)
    end
end
