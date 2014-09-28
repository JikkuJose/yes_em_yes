module YesEmYes
  module Error
    %w{
      UnRecognizedServiceError
      RequiredArgumentMissingError
      MissingImplementationError
      AuthenticationError
      InvalidDataError
    }.each do |error|
      eval "class #{error} < StandardError; end"
    end
  end
end
