class RegistrationsController < Devise::RegistrationsController

    def create
        super do
            resource.create_cart!
            resource.save
        end
      end

    private
        def sign_up_params 
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
        
        def account_update_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation, :current_password)
        end
end
