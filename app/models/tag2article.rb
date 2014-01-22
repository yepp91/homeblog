class Tag2article < ActiveRecord::Base
  belongs_to :article
  belongs_to :tags
  attr_accessible :Article, :Tags

  def self.add(article,tag)
  	@link_article_tag = Tag2article.new( { :Article => article, :Tags => tag })
  	@link_article_tag.save
  end

  def self.getTags(article)
    logger.info 'getTags by article '+article.to_s
  	@tags = Tag2article.joins(:Tags).where(:Article_id => article).select('tags.*')
    return @tags
  end

  def self.getArticle(tag)
    Tag2article.where(:Tags_id => tag).joins(:Article).select('articles.*')
  end
end
