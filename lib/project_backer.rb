class ProjectBacker

    @@all = []

    def self.all
        @@all
    end

    attr_reader :project, :backer
    
    def initialize(project, backer)
        @project, @backer = project, backer
        self.save
    end

    def save
        self.class.all << self if self.unique?
    end

    def unique?
        !self.class.all.include?(self) ? true : false
    end
    
end