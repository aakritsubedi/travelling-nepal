class NearMe {
  String districtName;
  String districtCode;
  String title;
  double lat;
  double lng;
  String desc;
  String description;
  String type;

  NearMe({
    this.districtName,
    this.districtCode,
    this.title,
    this.lat,
    this.lng,
    this.desc,
    this.description,
    this.type,
  });
}

List<NearMe> nearMePlaces = [
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Pashupatinath Temple', lat: 27.7105, lng: 85.3487, desc: 'is a famous and sacred Hindu temple complex that is located on the banks of the Bagmati River', description: '', type: 'temple'),
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Narayanhiti Meusum', lat: 27.6966217, lng: 85.3081791, desc: 'is a public museum in Kathmandu, Nepal located east of the Kaiser Mahal and next to Thamel.', description: '', type: 'Museum'),
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Shivapuri Hills', lat: 27.7310019, lng: 85.2835511, desc: 'known for hiking & scenic views from its summit of the Himalayas & Kathmandu Valley', description: '', type: 'hiking'),
  NearMe(districtName: 'Lalitpur', districtCode: 'LAL', title: 'Naagdaha Lake', lat: 27.6245611, lng: 85.3319478, desc: 'is a lake in the Dhapakhel of Lalitpur District', description: '', type: 'lake'),
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Pashupatinath Temple', lat: 27.7105, lng: 85.3487, desc: 'is a famous and sacred Hindu temple complex that is located on the banks of the Bagmati River', description: '', type: 'temple'),
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Narayanhiti Meusum', lat: 27.6966217, lng: 85.3081791, desc: 'is a public museum in Kathmandu, Nepal located east of the Kaiser Mahal and next to Thamel.', description: '', type: 'Museum'),
  NearMe(districtName: 'Kathmandu', districtCode: 'KAT', title: 'Shivapuri Hills', lat: 27.7310019, lng: 85.2835511, desc: 'known for hiking & scenic views from its summit of the Himalayas & Kathmandu Valley', description: '', type: 'hiking'),
  NearMe(districtName: 'Lalitpur', districtCode: 'LAL', title: 'Naagdaha Lake', lat: 27.6245611, lng: 85.3319478, desc: 'is a lake in the Dhapakhel of Lalitpur District', description: '', type: 'lake'),
];