module SubmitResultsHelper
    #Result submission helpers
    def submited_before?(course)
        registration = course.registrations.where("session==? AND status > ?", current_session, 1)
        if registration.nil?
            return false
        else 
            return true
        end
    end
end
