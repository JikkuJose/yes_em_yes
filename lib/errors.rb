module YesEmYes
  module Error
    %w{
      UnRecognizedServiceError
      RequiredArgumentMissingError
      MissingImplementationError
    }.each do |error|
      eval "class #{error} < StandardError; end"
    end
  end
end
