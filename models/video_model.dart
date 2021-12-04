class Video{

   String? videoId='';
   String title='';
   String  thumbnailUrl='';
   String  channelTitle='';



  Video({
    this.videoId='',
    this.title='',
    this.thumbnailUrl='',
    this.channelTitle='',
  });

  factory Video.fromMap(Map<String, dynamic> item){
    // print(item['id']['videoId']);
    return Video(
      videoId: item['id']['videoId'],
      title: item['snippet']['title'],
      thumbnailUrl: item['snippet']['thumbnails'] ['high'] ['url'],
      channelTitle: item['snippet']['channelTitle'],
    );
  }
}