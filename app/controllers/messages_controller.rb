#!/usr/bin/env ruby
# encoding: utf-8

class MessagesController < ApplicationController

  def new
    @message = Message.new
  end

  def create
    @message = Message.create(message_params)
    if @message.save
      UserMailer.send_recipe(@message).deliver_now
      flash[:success] = "Message envoyé !"
    else
      flash[:error] = "Erreur lors de l'envoi du message"
    end
    redirect_to :back
  end

  private

  def message_params
    params.require(:message).permit(:subject, :message, :email)
  end

end
