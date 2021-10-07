class Project

    @@all = []

    def self.all
        @@all
    end

    attr_reader :title
    
    def initialize(title)
        @title = title
        self.save
    end

    def save
        self.class.all << self if self.unique?
    end

    def unique?
        !self.class.all.include?(self) ? true : false
    end

    def add_backer(backer)
        project_backer = ProjectBacker.new(self, backer)
    end

    def projects
        projects = ProjectBacker.all.find_all{|pb|pb.project == self}
    end

    def backers
        backers = self.projects.map{|project|project.backer}
    end

end