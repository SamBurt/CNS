class ChildrenController < ApplicationController

  def new
    if user_signed_in?
      @parent = Parent.find(params[:parent_id])
      @child = Child.new
    else
      redirect_to new_user_registration_path and return
    end
    #authorize @child.parent.user
  end

  # def index
  #   @parent = Parent.find(params[:parent_id])
  #   @children = @parent.children
  #   authorize @child.parent.user
  # end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    c = Child.find(params[:id])
    authorize c.parent.user unless current_user.admin?
    date_of_birth = c.dob
    old_status = c.status
    old_program = c.program
    c.update(create_update_params)
    if c.save && check_valid_info()
      if c.dob != date_of_birth
        # c.dob = date_of_birth
        c.save
      elsif c.status != old_status
        # c.status =
        c.save
      elsif c.program != old_program
        c.save
      end
      flash[:notice] = "#{c.firstname} #{c.lastname} was registered."
      redirect_to parent_child_path(c)
    else
      flash[:notice] = "Error registering #{c.firstname} #{c.lastname}"
      redirect_to edit_parent_child_path(c)
    end
  end

  def show
    id = params[:id]
    @child = Child.find(id)
    authorize @child.parent.user unless current_user.admin?
    #byebug
    @child.days = ""

    if @child.week == 5
      @child.days = "M, T, W, Th, F"
    elsif @child.week == 3
      @child.days = "M, W, F"
    elsif @child.week == 2
      @child.days = "T, Th"
    end

    if !@child.m2.nil? && @child.week.nil?
      @child.days += "M, "
    end
    if !@child.t2.nil? && @child.week.nil?
      @child.days += "T, "
    end
    if !@child.w2.nil? && @child.week.nil?
      @child.days += "W, "
    end
    if !@child.r2.nil? && @child.week.nil?
      @child.days += "Th, "
    end
    if !@child.f2.nil? && @child.week.nil?
      @child.days += "F"
    end
    if @child.days =~ /, $/
      @child.days.chop!.chop!
    end

    @child.weeks = ""
    if @child.week1
      @child.weeks += "1, "
    end
    if @child.week2
      @child.weeks += "2, "
    end
    if @child.week3
      @child.weeks += "3, "
    end
    if @child.week4
      @child.weeks += "4, "
    end
    if @child.week5
      @child.weeks += "5, "
    end
    if @child.week6
      @child.weeks += "6, "
    end
    if @child.week7
      @child.weeks += "7, "
    end
    if @child.week8
      @child.weeks += "8, "
    end
    if @child.weeks =~ /, $/
      @child.weeks.chop!.chop!
    end

  end

  def create
    @parent = Parent.find(params[:parent_id])
    #@user = @parent.user
    @child = Child.new(create_update_params)
    #authorize @child.parent.user unless current_user.admin?
    @parent.children << @child
    #byebug
    if @child.save && check_valid_info
      # if !(check_valid_info)
          # redirect_to new_parent_child_path(@parent) and return
      # end
      flash[:notice] = "New child '#{@child.firstname} #{@child.lastname}' created"
      redirect_to parent_path(@parent) and return
    else
        flash[:warning] = "Error creating new child"
        redirect_to new_parent_child_path(@parent) and return
    end
  end

  private
      def create_update_params
          params.require(:child).permit(:firstname, :lastname, :dob, :status, :program, :time, :week, :m2, :t2, :w2, :r2, :f2, :comments, :attending_rec, :week1, :week2, :week3, :week4, :week5, :week6, :week7, :week8, :parent_id)
      end

      def check_valid_info()
          child_hash = params[:child]
          if child_hash[:status] == "Select a Program" || child_hash[:status].nil? || child_hash[:program] == "Select a Program" || child_hash[:program].nil?
              #flash[:warning] = "Error, need to specify status"
              return false
          end
          return true
      end

end
