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

  def overview
    @categories = Category.all
    @contributions = Contribution.all
    @groups = Group.all

    @groupCatFinished = {}
    @statistics = {}
    #prepare the statistics table
    @categories.each do |category|
      catentry = {}
      @statistics[category] = catentry

      groupCatFinishedEntry = {}
      @groupCatFinished[category] = groupCatFinishedEntry

      @groups.each do |group|
        catentry[group] = 0
        groupCatFinishedEntry[group] = "white"
      end
    end

    #fill the statistics table based on contributions
    @contributions.each do |contrib|
      #puts "found contrib: "+contrib.title
      catentry = @statistics[contrib.category]
      groupcatentry = catentry[contrib.user.group]

      #puts "group: "+contrib.user.group.name
      #puts "cat: "+contrib.category.title
      #puts "current amount "+groupcatentry.to_s
      #puts "trying to add "+contrib.amount

      groupcatentry += contrib.amount.to_i
      catentry[contrib.user.group] = groupcatentry

      @groupCatFinished[contrib.category][contrib.user.group] = "green"
    end

    # did the group finish ALL categories at least once?
    @groupFinished = {}
    @groups.each do |group|
      finishedAll = true
      @categories.each do |category|
        if @statistics[category][group] <= 0
          finishedAll = false
          #puts "group "+group.name+" did NOT finish "+category.title
        end
      end

      if finishedAll
        @groupFinished[group] = "green"
      else
        @groupFinished[group] = "#FFAAAA"
      end
    end

  end
end
