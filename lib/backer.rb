class Backer

    @@all = []

    def self.all
        @@all
    end

    attr_reader :name
    
    def initialize(name)
        @name = name
        self.save
    end

    def save
        self.class.all << self if self.unique?
    end

    def unique?
        !self.class.all.include?(self) ? true : false
    end

    def back_project(project)
        project_backer = ProjectBacker.new(project, self)
    end

    def projects
        projects = ProjectBacker.all.find_all{|p|p.backer == self}
    end

    def backed_projects
        self.projects.map{|p|p.project}
    end
    
end