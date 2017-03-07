class GramV2Client

  class ResourceNotFound < StandardError

    attr_reader :query
    attr_reader :resource
    attr_reader :source_exception


    def initialize(query: nil, resource: nil, source_exception: nil)
      @error=self.class.name
      @query=query
      @resource=resource
      @source_exception=source_exception
    end

    def to_s
      message = "Failed."
      message << " #{resource} not found" if resource
      message << " with query '#{query}'" if query
    end

  end


end