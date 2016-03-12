#!/usr/bin/env ruby
# encoding: utf-8

class NewslettersController < ApplicationController

    @newsletter = Newsletter.new

    def create
        @newsletter = Newsletter.new(newsletter_params)
        if @newsletter.save
            flash[:notice] = "Félicitations, vous serez averti lors de la mise en ligne de l'application"
            redirect_to root_path
        else
            flash[:error] = "Votre inscription à échoué, merci de réessayer"
            redirect_to(:back)
        end
    end

    private

    def newsletter_params
        params.require(:newsletter).permit(:email)
    end

end
