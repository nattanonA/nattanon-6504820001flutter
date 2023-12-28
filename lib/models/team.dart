class Team {
  List<TeamName>? teamname;

  Team({this.teamname});

  Team.fromJson(Map<String, dynamic> json) {
    if (json['TeamName'] != null) {
      teamname = <TeamName>[];
      json['TeamName'].forEach((v) {
        teamname!.add(new TeamName.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.teamname != null) {
      data['TeamName'] = this.teamname!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TeamName {
  String? id;
  String? teamName;
  String? teamDetail;
  String? teamLat;
  String? teamLong;
  String? teamLogo;

  TeamName(
      {this.id,
      this.teamName,
      this.teamDetail,
      this.teamLat,
      this.teamLong,
      this.teamLogo});

  TeamName.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    teamName = json['team_name'];
    teamDetail = json['team_detail'];
    teamLat = json['team_lat'];
    teamLong = json['team_long'];
    teamLogo = json['team_logo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['team_name'] = this.teamName;
    data['team_detail'] = this.teamDetail;
    data['team_lat'] = this.teamLat;
    data['team_long'] = this.teamLong;
    data['team_logo'] = this.teamLogo;
    return data;
  }
}
