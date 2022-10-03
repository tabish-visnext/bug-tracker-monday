class ProjectsController < ApplicationController
    load_and_authorize_resource


    def index
        @p = Project.all
        @usr = User.all
        
        
    end


    def show
        @p = Project.find(params[:id])
        
        @usr = User.find(params[:id])
        
    end

    def new 
        @p = Project.new
    end 


    def create
        @p = Project.new(project_params)
        @p.creator_id = current_user.id
        
        
        if @p.save
            
            flash[:success] = "project saveed successfully"
            redirect_to project_path(current_user)
    
        else 
            render 'new'
        end  
    end 


    def edit  
        @p = Project.find(params[:id])
        #if can? :edit,@p
        #else
            #flash[:alert] = "you are not allowed to edit"
            #redirect_to projects_path(@p)
        #end
    end 

    def update 
        @p = Project.find(params[:id])
        if @p.update(project_params)
            flash[:success] = "project is updated successfully"
            redirect_to project_path(current_user)
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @p = Project.find(params[:id])
        @p.destroy
        redirect_to project_path(current_user)
    end


    private
 
    def project_params
        params.require(:project).permit(:projectname, :description, :assignee_id, :role)
        
    end

end