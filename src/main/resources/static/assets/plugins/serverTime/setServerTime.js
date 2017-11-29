var ServerTime = {
  // netUrl : "http://counter.sina.com.cn/time?fm=JS&vn=ServerSeconds&fn=b",//�������ӿ�
  netUrl : "http://hq.sinajs.cn/?format=json&func=window.ServerSeconds=hq_json_sys_time;if%28typeof%28b%29==%27function%27%29b%28%29;" + '&r=' + Math.random() + "&list=sys_time",//�������ӿ�
  timeZone : 8, //����ʱ�� +8
  maxDifference : 60, //����������(��)
  year : 2010, //��
  month : 11, //��
  date : 1, //��
  hours : 0, //Сʱ
  minutes : 0, //����
  seconds : 0, //��
  monthTwoBit : 1, //�� ��λ
  dateTwoBit : 1, //�� ��λ
  hoursTwoBit : "00",//Сʱ ��λ
  minutesTwoBit : "00",//���� ��λ
  secondsTwoBit : "00", //�� ��λ
  dateObj : {}, //Date ����
  _tryNum : 0,
  begin : function(){ //��ʼִ��
    //����ʹ����ϵͳʱ��
    this._systemObj = new Date();
    this.dateObj = this._systemObj;
    this._analyse();
    
    this._requestNet();
    this._listenTimeObj = setInterval("ServerTime._listen()",500);
  },
  $ : function(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}},
  _systemObj : {},
  _listenTimeObj : null,
  _difference : 0,//��
  _requestNet : function(){ //��������ʱ��
    var thisTemp = this;
    this._tryNum ++;
    if(this._tryNum >= 3){return};
    this._getJsData(this.netUrl,function(){thisTemp._responeNet()});
  },
  _responeNet : function(){ //��������ʱ���Ӧ
    if(typeof(ServerSeconds) == 'undefined'){
      if(this._tryNum < 20){
        this._tryNum ++;
        var thisTemp = this;
        setTimeout(function(){thisTemp._responeNet()},100);
        return;
      };
    };
    this.dateObj.setTime(ServerSeconds * 1000);
    
    this._difference = ServerSeconds - (new Date()).getTime()/1000; //������ʱ����ϵͳʱ���(��)
    this._tryNum = 0;
    this._analyse();
  },
  _listen : function(){ //����ʱ��仯
    var tempObj = new Date();
    if(tempObj.getSeconds() != this._systemObj.getSeconds()){
      this._systemObj = tempObj;
      this.dateObj.setTime(this.dateObj.getTime()+1000); //��1��
    };
    if(Math.abs((this.dateObj.getTime() - this._systemObj.getTime())/1000 - this._difference) >= this.maxDifference){
      this._requestNet();
    };
    this._analyse();
  },
  _analyse : function(){ //�ֽ�ʱ��
    var nowDate = new Date(this.dateObj.getTime() + (this.timeZone - 8) * 3600000);
    console.log(nowDate);
    this.year = nowDate.getFullYear();
    this.month = nowDate.getMonth() + 1;
    this.date = nowDate.getDate();
    this.hours = nowDate.getHours();
    this.minutes = nowDate.getMinutes();
    this.seconds = nowDate.getSeconds();
    
    //��λ
    this.monthTwoBit = this.month > 9?this.month.toString():"0" + this.month;
    this.dateTwoBit = this.date > 9?this.date.toString():"0" + this.date;
    this.hoursTwoBit = this.hours > 9?this.hours.toString():"0" + this.hours;
    this.minutesTwoBit = this.minutes > 9?this.minutes.toString():"0" + this.minutes;
    this.secondsTwoBit = this.seconds > 9?this.seconds.toString():"0" + this.seconds;
  },
  _getJsData : function(url,dispose){
    var Snode = document.createElement("script");
    Snode.type = "text/javascript";
    Snode.language = "javascript";
    Snode.defer = true;
    
    //��ʱ
    Snode.TimeOutObj = setTimeout(function(){
      Snode.parentNode.removeChild(Snode);
    },10000);
    Snode[Snode.onreadystatechange === null ? "onreadystatechange" : "onload"] = function(){
      if(this.onreadystatechange){
        if(this.readyState != "loaded" && this.readyState != "complete") {return;}
      };
      if(dispose){setTimeout(dispose,100)};
      this[this.onreadystatechange ? "onreadystatechange" : "onload"] = null;
      clearTimeout(Snode.TimeOutObj);
      setTimeout(function(){Snode.parentNode.removeChild(Snode)},1000);
    };
    Snode.src = url;
    document.getElementsByTagName("head")[0].appendChild(Snode);
  }
}
ServerTime.timeZone = 8;
ServerTime.begin();