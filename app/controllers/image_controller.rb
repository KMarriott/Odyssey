class ImageController < ApplicationController


	def index
		@users = User.all
		@images = Image.all

	end

	def show
	end

	def new
		@images = Image.new
	end


	def create
		@image = Image.new(user_params)
		@image.user_id = current_user.id
		if(@image.save)
			pp @image
		else
			pp @image.errors
		end		
		
		pp @image
		 # @image = Image.create( user_params )
		 redirect_to :back
		end

		def update
		# respond_to do |format|
		# 	if @user.update(user_params)
		# 		format.html { redirect_to @user, notice: 'User was successfully updated.' }
		# 		format.json { head :no_content }
		# 	else
		# 		format.html { render action: 'edit' }
		# 		format.json { render json: @user.errors, status: :unprocessable_entity }
		# 	end
		# end
	end

end


def destroy
	@user.destroy
	respond_to do |format|
		format.html { redirect_to users_url }
		format.json { head :no_content }
	end
end

private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    	@user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
    	params.require(:image).permit(:avatar, :name)

    end
