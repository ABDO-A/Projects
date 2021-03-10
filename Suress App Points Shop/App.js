import { StatusBar } from 'expo-status-bar';
import React, { Component,  useState } from 'react';
import { render } from 'react-dom';
import { StyleSheet, Text, View, TouchableOpacity, Alert, 
  AppRegistry, ScrollView, SafeAreaView, Platform, Image } from 'react-native';





export default function app() {

  const [rewards, setRewards] = useState([
    {name: 'App Store (25000)', key: '1', image:'./app/assets/pointpic.png'},
    {name: 'Google Play (25000)', key: '2'},
    {name: 'Amazon (25000)', key: '3'},
    {name: 'PlayStation Plus (25000)', key: '4'},
    {name: 'Xbox Live (25000)', key: '5'},
    {name: 'Microsoft Store (25000)', key: '6'},
  ]);

  ButtonClickCheckFunction = () =>{
 
    Alert.prompt("Congratulations!", "In order to redeem your reward, please enter your email address below to receive your gift card code:")
 
  }



  
  var points = 26523;
  var ptString = '' + {points};
  return (
    <SafeAreaView style={styles.MainContainer}>
      
     
      
       <View style={styles.rectangle} />
       <View style={styles.rectangle2} />
       <View style={styles.mainRect}>
      
          <ScrollView>
          
      {rewards.map((item) => {
        return (
          
          <View style={styles.item}>
          <View key = {item.key}>
            <Text style = {styles.rewardText}> {item.name} </Text>
            </View>
            <View style={styles.miniRect}/>
            <Image 
          source={require('./app/assets/giftcard.png')} 
          style={styles.ImageGift} 
          />
          <TouchableOpacity
          style={styles.getButton}
          activeOpacity = { .5 }
          onPress={ this.ButtonClickCheckFunction }>
            
            <Text style={styles.getText}> GET </Text>

      </TouchableOpacity>
          </View>
          
        )
      })}

      
          </ScrollView>
        
        </View>
       

       <TouchableOpacity
          style={styles.pointsButtonStyle}
          activeOpacity = { .5 }
          >
            <Image 
          source={require('./app/assets/pointpic.png')} 
          style={styles.ImageIconStyle} 
          />
            <Text style={styles.TextStyle}> {points} </Text>

      </TouchableOpacity>

      <StatusBar barStyle="light-content"/>
      
     
          
          <Text style = {styles.header}> Points Shop </Text>
         
         
 
      </SafeAreaView>
      
    );
  }


const styles = StyleSheet.create({
 
  MainContainer: {
    flex: 1,
    justifyContent: 'center',
    backgroundColor: '#F5FCFF',
    paddingTop: Platform.OS === "android" ? StatusBar.currentHeight : 0,
  },
 
  pointsButtonStyle: {
    top: 40,
    right: -12,
    position: "absolute",
    width: 80,
    height: 35,
    marginTop:10,
    paddingTop:9,
    paddingBottom:2,
    marginLeft:20,
    marginRight:30,
    backgroundColor:'#FFF',
    borderRadius:100,
    borderWidth: 1,
    borderColor: '#000'
  },
 
  TextStyle:{
      color:'#000',
      textAlign:'center',
      left: 5,
  },

  rectangle: {
    top: -4,
    right: -3,
    position: "absolute",
    width: 425,
    height: 100,
    backgroundColor: "white",
    borderWidth: 3,
    borderColor: '#000',
  },

  rectangle2: {
    bottom: -25,
    right: -3,
    position: "absolute",
    width: 425,
    height: 100,
    backgroundColor: "white",
    borderWidth: 3,
    borderColor: '#000',
  },

  mainRect: {
    top: 97,
    right: -3,
    position: "absolute",
    width: 425,
    height: 724,
    backgroundColor: "white",
    borderWidth: 0,
    borderColor: '#000',
  },

  item: {
    height: 250,
    backgroundColor: 'grey',
    textAlign: 'center',
    borderWidth: 3,
    borderColor: '#FFF',
    fontSize: 24
  },

  header: {
    top: 48,
    fontSize: 40,
    position: 'absolute',
    
  },

  ImageIconStyle: {
    top: 4,
    left: 2,
    margin: 5,
    width: 15,
    height: 15,
    resizeMode: 'stretch',
    position: 'absolute'
  },

  miniRect: {
    position: "absolute",
    width: 400,
    height: 175,
    bottom: 13,
    left: 13,
    backgroundColor: "grey",
    borderWidth: 2,
    borderColor: '#FFF',
    borderRadius:50,
  },

  rewardText: {
    fontSize: 24,
    left: 20,
    top: 10,
    color: 'white',
  },

  ImageGift: {
    top: 50,
    left: 110,
    margin: 5,
    width: 200,
    height: 180,
    resizeMode: 'stretch',
    position: 'absolute'
  },

  getButton: {
    position: "absolute",
    left: 300,
    borderWidth: 2,
    borderColor: '#fff',
    height: 40,
    borderRadius: 20,
    margin: 5,
    width: 80,
    height: 35,
    marginTop:10,
    paddingTop:9,
    paddingBottom:2,
    marginLeft:20,
    marginRight:30,
    backgroundColor:'purple',
  },

  getText: {
    color:'#FFF',
    textAlign:'center',
  }
});
