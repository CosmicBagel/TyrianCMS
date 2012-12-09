class AccountsController < ApplicationController
    def index
        @accounts = Account.all
    end
    def show
        @account = Account.find(params[:id])
    end
    def new
        @account = Account.new
    end
    def create
        @account = Account.new(params[:account])
        @account.password = Digest::SHA512.hexdigest(@account.password)
        @profile = Profile.new
        @profile.save
        @account.profile = @profile.id
        if(@account.save)
            redirect_to accounts_path, :notice => "Your account was created!"
        else
            render "new"
        end
    end
    def edit
        @account = Account.find(params[:id])
    end
    def update
        @account = Account.find(params[:id])
        if(@account.update_attributes(params[:account]))
            @account.password = Digest::SHA512.hexdigest(@account.password)
            @account.save
            redirect_to accounts_path, :notice => "Account updated."
        else
            render "edit"
        end
    end
    def destroy
        @account = Account.find(params[:id])
        @profile = Profile.find(@account.profile)
        @profile.destroy
        @account.destroy
        redirect_to accounts_path, :notice => "Account has been deleted."
    end
end
