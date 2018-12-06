  class CustomFailure < Devise::FailureApp
    def route(scope)
      :root
    end
  end
