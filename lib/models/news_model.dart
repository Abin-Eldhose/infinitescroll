class NewsModel {
  int? id;
  int? langId;
  String? title;
  String? titleSlug;
  String? keywords;
  String? summary;
  String? content;
  int? categoryId;
  String? imageBig;
  String? imageDefault;
  String? imageSlider;
  String? imageMid;
  String? imageSmall;
  String? imageMime;
  String? imageStorage;
  String? optionalUrl;
  int? pageviews;
  int? needAuth;
  int? isSlider;
  int? sliderOrder;
  int? isFeatured;
  int? featuredOrder;
  int? isRecommended;
  int? isBreaking;
  int? isScheduled;
  int? visibility;
  int? showRightColumn;
  String? postType;
  String? videoStorage;
  int? userId;
  int? status;
  int? showPostUrl;
  String? imageDescription;
  int? showItemNumbers;
  int? isPollPublic;
  String? createdAt;

  NewsModel(
      {id,
      langId,
      title,
      titleSlug,
      keywords,
      summary,
      content,
      categoryId,
      imageBig,
      imageDefault,
      imageSlider,
      imageMid,
      imageSmall,
      imageMime,
      imageStorage,
      optionalUrl,
      pageviews,
      needAuth,
      isSlider,
      sliderOrder,
      isFeatured,
      featuredOrder,
      isRecommended,
      isBreaking,
      isScheduled,
      visibility,
      showRightColumn,
      postType,
      videoStorage,
      userId,
      status,
      showPostUrl,
      imageDescription,
      showItemNumbers,
      isPollPublic,
      createdAt});

  NewsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    langId = json['lang_id'];
    title = json['title'];
    titleSlug = json['title_slug'];
    keywords = json['keywords'];
    summary = json['summary'];
    content = json['content'];
    categoryId = json['category_id'];
    imageBig = json['image_big'];
    imageDefault = json['image_default'];
    imageSlider = json['image_slider'];
    imageMid = json['image_mid'];
    imageSmall = json['image_small'];
    imageMime = json['image_mime'];
    imageStorage = json['image_storage'];
    optionalUrl = json['optional_url'];
    pageviews = json['pageviews'];
    needAuth = json['need_auth'];
    isSlider = json['is_slider'];
    sliderOrder = json['slider_order'];
    isFeatured = json['is_featured'];
    featuredOrder = json['featured_order'];
    isRecommended = json['is_recommended'];
    isBreaking = json['is_breaking'];
    isScheduled = json['is_scheduled'];
    visibility = json['visibility'];
    showRightColumn = json['show_right_column'];
    postType = json['post_type'];
    videoStorage = json['video_storage'];
    userId = json['user_id'];
    status = json['status'];
    showPostUrl = json['show_post_url'];
    imageDescription = json['image_description'];
    showItemNumbers = json['show_item_numbers'];
    isPollPublic = json['is_poll_public'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['lang_id'] = langId;
    data['title'] = title;
    data['title_slug'] = titleSlug;
    data['keywords'] = keywords;
    data['summary'] = summary;
    data['content'] = content;
    data['category_id'] = categoryId;
    data['image_big'] = imageBig;
    data['image_default'] = imageDefault;
    data['image_slider'] = imageSlider;
    data['image_mid'] = imageMid;
    data['image_small'] = imageSmall;
    data['image_mime'] = imageMime;
    data['image_storage'] = imageStorage;
    data['optional_url'] = optionalUrl;
    data['pageviews'] = pageviews;
    data['need_auth'] = needAuth;
    data['is_slider'] = isSlider;
    data['slider_order'] = sliderOrder;
    data['is_featured'] = isFeatured;
    data['featured_order'] = featuredOrder;
    data['is_recommended'] = isRecommended;
    data['is_breaking'] = isBreaking;
    data['is_scheduled'] = isScheduled;
    data['visibility'] = visibility;
    data['show_right_column'] = showRightColumn;
    data['post_type'] = postType;
    data['video_storage'] = videoStorage;
    data['user_id'] = userId;
    data['status'] = status;
    data['show_post_url'] = showPostUrl;
    data['image_description'] = imageDescription;
    data['show_item_numbers'] = showItemNumbers;
    data['is_poll_public'] = isPollPublic;
    data['created_at'] = createdAt;
    return data;
  }
}
