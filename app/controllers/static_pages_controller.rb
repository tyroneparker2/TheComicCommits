class StaticPagesController < ApplicationController
  def review
    respond_to do |format|
      format.html { render :review, locals: { feedback: {} } }
  end
end

def leave_review
  required = [:topic, :feedback_type, :message]
  form_complete = true
  required.each do |f|
    if params.has_key? f and not params[f].blank?
      # that's good news. do nothing
    else
      form_complete = false
    end
  end
  if form_complete
    form_status_msg = 'Thank you for your feedback!'
  else
    form_status_msg = 'Please fill in all the remaining form fields and resubmit.'
  end
  respond_to do |format|
    format.html { render :review, locals: { status_msg: form_status_msg, feedback: params } }
    end
  end
end