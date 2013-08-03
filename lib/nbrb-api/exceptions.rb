module Nbrb
  module Api
    class GeneralError < StandardError; end
    class OperationNotFound < GeneralError; end
  end
end
