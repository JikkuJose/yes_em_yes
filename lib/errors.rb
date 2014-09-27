module YesEmYes
  %w{
  RequiredArgumentMissingError
  }.each do |error|
    eval "class #{error} < StandardError; end"
  end
end
