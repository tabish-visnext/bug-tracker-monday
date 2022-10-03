class BugsController < ApplicationController
    load_and_authorize_resource



    
    def index
        @b = Bug.all
        @p = Project.all
        @usr = User.all
    end


    def show
        @b = Bug.find(params[:id])
        @p = Project.find(params[:id])
        @usr = User.find(params[:id])
    end

    def new 
        @b = Bug.new
    end 

    def create
        @b = Bug.new(bug_params)
        @b.creator_id = current_user.id
        if @b.save
            flash[:success] = "Bug created successfully"
            redirect_to bug_path(current_user)
    
        else 
            render 'new'
        end  
    end 


    def edit  
        @b = Bug.find(params[:id])
        #if can? 
            #:edit, @p
        #else
            #flash[:alert] = "you are not allowed to edit"
            #redirect_to projects_path(@p)
        #end
    end 

    def update 
        @b = Bug.find(params[:id])
        if @b.update(bug_params)
            flash[:success] = "bug is updated successfully"
            redirect_to bugs_path
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @b = Bug.find(params[:id])
        @b.destroy
        redirect_to bugs_path
    end


    private
 
    def bug_params
        params.require(:bug).permit(:title, :status, :bug_type, :assignee_id, :project_id)
        
    end


end