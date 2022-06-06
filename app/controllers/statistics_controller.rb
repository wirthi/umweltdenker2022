class StatisticsController < ApplicationController
  
  def contributions
    @categories = Category.all
    @contributions = Contribution.all
    @groups = Group.all

    @statistics = {}
    @contributions.each do |contrib|
      #puts "found contrib: "+contrib.title
      catentry = @statistics[contrib.category]
      if catentry.nil?
        #puts "catentry was nil"
        catentry = {}
        @statistics[contrib.category] = catentry
      end
      
      groupcatentry = catentry[contrib.user.group]
      if groupcatentry.nil?
        #puts "groupentrycat was nil"
        groupcatentry = 0
      end

      #puts "group: "+contrib.user.group.name
      #puts "cat: "+contrib.category.title
      #puts "current amount "+groupcatentry.to_s
      #puts "trying to add "+contrib.amount

      groupcatentry += contrib.amount.to_i
      catentry[contrib.user.group] = groupcatentry
    end
  end
end
