����   .� (cfwebstorefb6/cfcs/shipping/upstools$cfc  railo/runtime/ComponentPage  @C:\Railo20\webapps\ROOT\cfwebstorefb6\cfcs\shipping\upstools.cfc 
getVersion ()I �� getSourceLastModified ()J  aI�u newInstance M(Lrailo/runtime/PageContext;Ljava/lang/String;Z)Lrailo/runtime/ComponentImpl; railo/runtime/exp/PageException  this *Lcfwebstorefb6/cfcs/shipping/upstools$cfc; railo/runtime/ComponentImpl  railo/runtime/op/Caster  	toBoolean (Z)Ljava/lang/Boolean;  
      JThis component is used for working with the UPS Rates & Services XML tool.  UPS Rates & Services Tool  <init> �(Lrailo/runtime/ComponentPage;Ljava/lang/Boolean;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLrailo/runtime/type/StructImpl;)V ! "
  # initComponent ;(Lrailo/runtime/PageContext;Lrailo/runtime/ComponentImpl;)V % &
  ' 	getOutput ()Z ) *
  + railo/runtime/PageContext - 	setSilent / *
 . 0 init ;(Lrailo/runtime/PageContext;Lrailo/runtime/ComponentPage;)V 2 3
  4 undefinedScope &()Lrailo/runtime/type/scope/Undefined; 6 7
 . 8 "railo/runtime/type/scope/Undefined : checkArguments (Z)Z < = ; > 
beforeCall 7(Lrailo/runtime/PageContext;)Lrailo/runtime/type/Scope; @ A
  B 2 railo/runtime/type/UDF E #railo/runtime/type/FunctionArgument G upstools I public K �(Lrailo/runtime/Page;[Lrailo/runtime/type/FunctionArgument;ILjava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;Lrailo/runtime/type/StructImpl;)V ! M
 F N registerUDF =(Ljava/lang/String;Lrailo/runtime/type/UserDefinedFunction;)V P Q
  R getAllRates T struct V  UPS rates for multiple shipments X �Retrieve UPS rates for multiple shipments and combine rates into one structure, by running the doUPSRate method for each shipper. Z 	doUPSRate \ 'railo/runtime/type/FunctionArgumentImpl ^ 	accountno ` string b UPS Account Number d 'The UPS account number for the shipper. f k(Ljava/lang/String;Ljava/lang/String;ZLjava/lang/String;Ljava/lang/String;Lrailo/runtime/type/StructImpl;)V ! h
 _ i addressinfo k )Customer and Merchant address information m /The shipping and receiving address information. o pickup q Pickup Type s GThe type of package pickup being used. Default setting is daily pickup. u customerclass w Customer Classification y OThe UPS customer classification for the merchant. Default setting is wholesale. { package } Packaging Type  HType of packaging used for this shipment. Default is your own packaging. � units � Units of Measurement � JThe units of measurement being used. Default setting is pounds and inches. � service � UPS Service � BThe service to retrieve rates for. Default is to get all services. � Shipment � Shipment Information � NAn structure containing the information for the packages that will be shipped. � 	Accesskey � 
Access Key � The access key assigned by UPS. � UserID � The user ID assigned by UPS. � UPSPassword � The password assigned by UPS. � timeout � numeric � Tag Timeout � RAmount of time to allow before timing out the http request. Default is 10 seconds. � debug � boolean � Output Debug � 4Toggles whether to display debug information or not. � Get a UPS Rate � eThis function retrieves a UPS rate for the specified service, package weight, origin and destination. � getTracking � TrackingNumber � Tracking Number � %The tracking number for the shipment. � Struct � UPS Tracking Tool � XThis function retrieves tracking information from UPS, given a specific tracking number. � VerifyAddress � City � ,The city for the shipping address to verify. � State � -The state for the shipping address to verify. � Zipcode � Zip Code � 0The zip code for the shipping address to verify. � UPS Address Verification Tool � SThis function takes a city, state, and zip and returns matching addresses from UPS. � 
UPSDecrypt � stringin � any � 7Used to return the decrypted strings for the UPS tools. � variablesScope ()Lrailo/runtime/type/Scope; � �
 . � key1 #Lrailo/runtime/type/Collection$Key; � �	  � cfweb256 � railo/runtime/type/Scope � set I(Lrailo/runtime/type/Collection$Key;Ljava/lang/Object;)Ljava/lang/Object; � � � � key2 � �	  � *.* � )railo/runtime/functions/system/ExpandPath � call A(Lrailo/runtime/PageContext;Ljava/lang/String;)Ljava/lang/String; � �
 � � 3railo/runtime/functions/system/GetDirectoryFromPath �
 � � get 7(Lrailo/runtime/type/Collection$Key;)Ljava/lang/Object; �  � toString &(Ljava/lang/Object;)Ljava/lang/String;
  logs java/lang/String	 concat &(Ljava/lang/String;)Ljava/lang/String;

 requestScope �
 . key3 �	  key4 �	  ups_log.txt logging.cfm include (Ljava/lang/String;)V
 . java/lang/Throwable  toPageException 8(Ljava/lang/Throwable;)Lrailo/runtime/exp/PageException;"#
 $ unsetSilent& *
 .' 	afterCall 8(Lrailo/runtime/PageContext;Lrailo/runtime/type/Scope;)V)*
 + udfCall X(Lrailo/runtime/PageContext;Lrailo/runtime/type/UserDefinedFunction;I)Ljava/lang/Object; key5/ �	 0 ; 
localScope3 �
 .4 key66 �	 7 (railo/runtime/functions/struct/StructNew9 8(Lrailo/runtime/PageContext;)Lrailo/runtime/type/Struct; �;
:< key7> �	 ? key8A �	 B key9D �	 E key10G �	 H key11J �	 K toDouble (D)Ljava/lang/Double;MN
 O key12Q �	 R key13T �	 U key14W �	 X argumentsScope %()Lrailo/runtime/type/scope/Argument;Z[
 .\ key15^ �	 _ !railo/runtime/type/scope/Argumentab toArray .(Ljava/lang/Object;)Lrailo/runtime/type/Array;de
 f 'railo/runtime/functions/arrays/ArrayLenh 8(Lrailo/runtime/PageContext;Lrailo/runtime/type/Array;)D �j
ik toRefmN
 n key16p �	 q &(Z)Lrailo/runtime/type/scope/Argument;Zs
 .t toStruct /(Ljava/lang/Object;)Lrailo/runtime/type/Struct;vw
 x shipmentz +railo/runtime/functions/struct/StructInsert| ](Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;Ljava/lang/String;Ljava/lang/Object;)Z �~
} toDoubleValue (Ljava/lang/Object;)D��
 � item� -railo/runtime/interpreter/VariableInterpreter� getVariableReference Y(Lrailo/runtime/PageContext;Ljava/lang/String;)Lrailo/runtime/type/ref/VariableReference;��
�� java/lang/Double� (D)V !�
�� (railo/runtime/type/ref/VariableReference� A(Lrailo/runtime/PageContext;Ljava/lang/Object;)Ljava/lang/Object; ��
�� touch I(Ljava/lang/Object;Lrailo/runtime/type/Collection$Key;)Ljava/lang/Object;��
 .� key17� �	 � 8(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object; ��
 .� [(Ljava/lang/Object;Lrailo/runtime/type/Collection$Key;Ljava/lang/Object;)Ljava/lang/Object; ��
 .� getCollection�  ;� ��
 .� +railo/runtime/functions/struct/StructUpdate�
� key18� �	 � key19� �	 � key20� �	 � key21� �	 � java/lang/Object� argumentcollection� $railo/runtime/type/FunctionValueImpl� H(Ljava/lang/String;Ljava/lang/Object;)Lrailo/runtime/type/FunctionValue; �
�� getFunctionWithNamedValues \(Ljava/lang/Object;Lrailo/runtime/type/Collection$Key;[Ljava/lang/Object;)Ljava/lang/Object;��
 .���
 .� key22� �	 � ; � key23� �	 � toBooleanValue (Ljava/lang/Object;)Z��
 � railo/runtime/op/Operator� compare (Ljava/lang/Object;D)I��
�� key24� �	 � +railo/runtime/functions/struct/StructAppend� U(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;Lrailo/runtime/type/Struct;Z)Z ��
�� ,railo/runtime/functions/struct/StructKeyList� J(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;)Ljava/lang/String; ��
�� 'railo/runtime/functions/list/ListAppend� S(Lrailo/runtime/PageContext;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; ��
�� *railo/runtime/functions/struct/StructCount� 9(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;)D ��
�� (D)Z��
 � toCollection 3(Ljava/lang/Object;)Lrailo/runtime/type/Collection;��
 � railo/runtime/type/Collection� keyIterator ()Ljava/util/Iterator;���� key� getReference H(Ljava/lang/Object;Ljava/lang/String;)Lrailo/runtime/type/ref/Reference;��
 .  java/util/Iterator hasNext * next ()Ljava/lang/Object;	  railo/runtime/type/ref/Reference� .railo/runtime/functions/struct/StructKeyExists K(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;Ljava/lang/String;)Z �
 J(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object; �
 . %railo/runtime/functions/list/ListFind B(Lrailo/runtime/PageContext;Ljava/lang/String;Ljava/lang/String;)D �
 )railo/runtime/functions/list/ListDeleteAt B(Lrailo/runtime/PageContext;Ljava/lang/String;D)Ljava/lang/String; �
 key25  �	 ! &railo/runtime/functions/list/ListGetAt#
$ 0& ^(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;Ljava/lang/String;Ljava/lang/Object;Z)Z �(
}) $railo/runtime/functions/list/ListLen+ 0(Lrailo/runtime/PageContext;Ljava/lang/String;)D �-
,. i I ,railo/runtime/functions/struct/StructIsEmpty2 9(Lrailo/runtime/PageContext;Lrailo/runtime/type/Struct;)Z �4
35 +railo/runtime/functions/struct/StructDelete7
8 Rates: "railo/runtime/functions/string/Len<
=. Success? 1A ErrorMessageC railo.runtime.tag.SaveContentE use 2(Ljava/lang/String;)Ljavax/servlet/jsp/tagext/Tag;GH
 .I railo/runtime/tag/SaveContentK 
v.adddebugM setVariableO
LP 
doStartTagR 
LS initBody &(Ljavax/servlet/jsp/tagext/BodyTag;I)VUV
 .W 			
			Y write[
 .\ railo.runtime.tag.Dump^ railo/runtime/tag/Dump` setVar (Ljava/lang/Object;)Vbc
ad
aS doEndTagg 
ah railo/runtime/exp/Abortj (I)Lrailo/runtime/exp/Abort; l
km reuse !(Ljavax/servlet/jsp/tagext/Tag;)Vop
 .q 
			s outputStart ()Vuv
 .w 	outputEndyv
 .z 
		| doAfterBody~ 
L doCatch (Ljava/lang/Throwable;)V��
L� popBody ()Ljavax/servlet/jsp/JspWriter;��
 .� 	doFinally�v
L�
Lh key26� �	 � key27� �	 � key28� �	 � key29� �	 � key30� �	 � key31� �	 � key32� �	 � key33� �	 � getFunction��
 .� key34� �	 � key35� �	 � key36� �	 � yes� isAbort (Ljava/lang/Throwable;)Z��
k� Any� 	typeEqual (Ljava/lang/String;)Z��
 � excpt� getCatchBlock�;
 � no� removeEL /(Lrailo/runtime/PageContext;)Ljava/lang/Object;��� key37� �	 � /�
,@        (DD)I��
�� key38� �	 � T(Lrailo/runtime/PageContext;Ljava/lang/String;DLjava/lang/String;)Ljava/lang/String; ��
$� key39� �	 � LBS� IN� key40� �	 � key41� �	 � key42� �	 � key43� �	 � v.temprequest� 
� @
<?xml version="1.0"?>
<AccessRequest>
	<AccessLicenseNumber>� !</AccessLicenseNumber>
	<UserId>� </UserId>
	<Password>�&</Password>
</AccessRequest>
<?xml version="1.0"?>
<RatingServiceSelectionRequest>
	<Request>
		<TransactionReference>
			<CustomerContext>CFWebstore Rate Request</CustomerContext>
			<XpciVersion>1.0001</XpciVersion>
		</TransactionReference>
		<RequestAction>Rate</RequestAction>
		� key44� �	 � All� '(Ljava/lang/Object;Ljava/lang/String;)I��
�� #<RequestOption>Shop</RequestOption>  &
	</Request>
	<PickupType>
		<Code> key45 �	  <</Code>
	</PickupType>
	<CustomerClassification>
		<Code> key46	 �	 
 B</Code>
	</CustomerClassification>
	<Shipment>
		<Shipper>
			 key47 �	  <ShipperNumber> </ShipperNumber> 
			<Address>
				 key48 �	  <City> </City> 
				 key49  �	 ! <PostalCode># </PostalCode>% 
				<CountryCode>' key50) �	 * K</CountryCode>
			</Address>
		</Shipper>
		<ShipTo>
			<Address>
				, </CountryCode>
				. key510 �	 1 ;<ResidentialAddressIndicator></ResidentialAddressIndicator>3 T
			</Address>
		</ShipTo>
		<ShipmentWeight>
			<UnitOfMeasurement>
				<Code>5 -</Code>
			</UnitOfMeasurement>
			<Weight>7 key529 �	 : "</Weight>
		</ShipmentWeight>
		< 
		<Service><Code>> </Code></Service>
		@ 
		
		B key53D �	 E0 	
		
			H key54J �	 K key55M �	 N key56P �	 Q 3
				<Package>
					<PackagingType>
						<Code>S key57U �	 V %</Code>
					</PackagingType>
					X key58Z �	 [ =
					<Dimensions>
						<UnitOfMeasurement>
							<Code>] 3</Code>
						</UnitOfMeasurement>
						<Length>_ </Length>
						<Width>a key59c �	 d </Width>
						<Height>f key60h �	 i $</Height>
					</Dimensions>
					k @
					<PackageWeight>
						<UnitOfMeasurement>
							<Code>m 3</Code>
						</UnitOfMeasurement>
						<Weight>o key61q �	 r 5</Weight>
					</PackageWeight>
				</Package>
			t 2
	</Shipment>
</RatingServiceSelectionRequest>
v railo.runtime.tag.Httpx railo/runtime/tag/Httpz hasBody (Z)V|}
{~ $https://www.ups.com/ups.app/xml/Rate� setUrl�
{� Post� 	setMethod�
{� setResolveurl�}
{� key62� �	 � 
setTimeout��
{�
{S 
	� railo.runtime.tag.HttpParam� railo/runtime/tag/HttpParam� XML� setType�
�� setName�
�� key63� �	 � setValue�c
��
�S
�h  
�
{
{h key64� �	 � key65� �	 � key66� �	 � $railo/runtime/functions/xml/XmlParse� A(Lrailo/runtime/PageContext;Ljava/lang/String;)Lorg/w3c/dom/Node; ��
�� key67� �	 � key68� �	 � key69� �	 � key70� �	 � key71� �	 � key72� �	 � toNode &(Ljava/lang/Object;)Lorg/w3c/dom/Node;��
 � RatedShipment� %railo/runtime/functions/xml/XmlSearch� [(Lrailo/runtime/PageContext;Lorg/w3c/dom/Node;Ljava/lang/String;)Lrailo/runtime/type/Array; ��
�� key73� �	 � key74� �	 � key75� �	 ���
 .� key76� �	 � key77� �	 � key78� �	 � key79� �	 � key80� �	 � key81� �	 � '(Ljava/lang/Object;Ljava/lang/Object;)I��
�� key82� �	 � key83� �	 � "Invalid response received from UPS� v.debug 
		<H4>Request</H4> 8railo/runtime/functions/displayFormatting/HTMLEditFormat
 � <br />
		<H4>Response</H4> >
@$       "railo/runtime/functions/string/Chr 0(Lrailo/runtime/PageContext;D)Ljava/lang/String; �
 ALL &railo/runtime/functions/string/Replace w(Lrailo/runtime/PageContext;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String; �
 key84 �	  key85 �	  'railo/runtime/functions/string/ToString  A(Lrailo/runtime/PageContext;Ljava/lang/Object;)Ljava/lang/String; �"
!# Request Sent% Response Received' mThere was an error in the setup for shipping rates, please contact the system admistrator for more assistance) key86+ �	 , D
<?xml version="1.0"?>
<AccessRequest>
     <AccessLicenseNumber>. %</AccessLicenseNumber>
     <UserId>0 key872 �	 3 </UserId>
     <Password>5h</Password>
</AccessRequest>
<?xml version="1.0"?>
<TrackRequest xml:lang="en-US"> 
  <Request> 
  <TransactionReference> 
    <CustomerContext></CustomerContext> 
    <XpciVersion>1.0001</XpciVersion> 
  </TransactionReference> 
  <RequestAction>Track</RequestAction> 
  <RequestOption>activity</RequestOption> 
  </Request> 
     <TrackingNumber>7 key889 �	 : %</TrackingNumber> 
</TrackRequest>
< %https://www.ups.com/ups.app/xml/Track> post@ 
 
       B  
    D key89F �	 G key90I �	 J v.theShipment.ShipTo.AddressL *railo/runtime/functions/decision/IsDefinedN 0(Lrailo/runtime/PageContext;Ljava/lang/String;)Z �P
OQ key91S �	 T _0055 (Lrailo/runtime/PageContext;)VVW
 X v.theShipment.ShipmentWeightZ key92\ �	 ] key93_ �	 ` key94b �	 c key95e �	 f key96h �	 i key97k �	 l v.theShipment.PickupDaten key98p �	 q #v.theShipment.ScheduledDeliveryDates key99u �	 v key100x �	 y key101{ �	 | 'railo/runtime/functions/arrays/ArrayNew~ 8(Lrailo/runtime/PageContext;D)Lrailo/runtime/type/Array; ��
� key102� �	 � $v.thePackage.RescheduledDeliveryDate���
 .� key103� �	 �  v.thePackage.Message.Description� key104� �	 � key105� �	 � key106� �	 � key107� �	 � 
//Activity� _0056�W
 � _0057�W
 � _0058�W
 � <br />
	 	<H4>Response</H4>�  
		� _0059�W
 � _0060�W
 � gThere was an error in the setup for tracking, please contact the system admistrator for more assistance� _0061�W
 � key108� �	 � key109� �	 �G</Password>
</AccessRequest>
<?xml version="1.0"?>
<AddressValidationRequest xml:lang="en-US"> 
  <Request> 
  <TransactionReference> 
    <CustomerContext></CustomerContext> 
    <XpciVersion>1.0001</XpciVersion> 
  </TransactionReference> 
  <RequestAction>AV</RequestAction> 
  </Request> 
   <Address>
   <City>� </City>
   <StateProvinceCode>� key110� �	 � %</StateProvinceCode>
   <PostalCode>� key111� �	 � <</PostalCode>
   </Address> 
</AddressValidationRequest>
� "https://www.ups.com/ups.app/xml/AV�  
 � key112� �	 � key113� �	 � key114� �	 � key115� �	 � key116� �	 � key117� �	 � key118� �	 � key119� �	 � key120� �	 � key121� �	 � sThere was an error in the setup for address verification, please contact the system admistrator for more assistance� key122� �	 � 'railo/runtime/functions/other/URLDecode�
� � %railo/runtime/functions/other/Decrypt�
�� udfDefaultValue 1(Lrailo/runtime/PageContext;II)Ljava/lang/Object; 01� 02� LBS/IN� 10� !v
   <clinit> 
encryptkey railo/runtime/type/KeyImpl getInstance 7(Ljava/lang/String;)Lrailo/runtime/type/Collection$Key;
	 	Directory Slash logfile  upsrates 	allresult unmatchedrates errormessage debugstring servicenames numshippers 	ShipArray  v" 
ItemStruct$ 	tempRates& tempList( Result* 	doupsrate, k. adddebug0 theresponse2 thepackages4 Packages6 success8 
upsdecrypt: 	DecryptOK< unitofweight> unitoflength@ CustomerAddrB AddressInfoD MerchantAddrF ShipFromH ZipJ CountryL 	ResidenceN TotalWeightP numshipmentsR numboxesT QuantityV Pack_LengthX 
Pack_WidthZ Pack_Height\ weight^ temprequest` UPSResponseb cfhttpd FileContentf XmlRooth 
UPSSuccessj Responsel ResponseStatusDescriptionn XMLTextp returnedRatesr NumRatest xv RateCodex Servicez Code| XmlText~ RateCost� TotalCharges� MonetaryValue� Error� ErrorDescription� logging� logxml� tracking� UserId� theShipment� Address� ShipTo� 
WeightUnit� ShipmentWeight� UnitOfMeasurement� Weight� TrackNumber� ShipmentIdentificationNumber� 
PickupDate� ScheduledDeliveryDate� NumPacks� Package� 
thePackage� RescheduledDeliveryDate� Status� Message� Description� Activity� 	validated� ValidAddress� AddressValidationResult� Quality� xmlText� NumAdds� 	Addresses� city� state� StateProvinceCode� zip� PostalCodeHighEnd� LocalVariableTable LineNumberTable 
Exceptions 
SourceFile      z  � �    � �    �    �   / �   6 �   > �   A �   D �   G �   J �   Q �   T �   W �   ^ �   p �   � �   � �   � �   � �   � �   � �   � �   � �     �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �    �   	 �    �    �     �   ) �   0 �   9 �   D �   J �   M �   P �   U �   Z �   c �   h �   q �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �    �    �   + �   2 �   9 �   F �   I �   S �   \ �   _ �   b �   e �   h �   k �   p �   u �   x �   { �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �   � �       |        �      	 
 |         �        |   W     %� Y*� �  ,� $:*+� (�   �            �          �       % & |  p  	  N,� ,� � +� 16,+*� 5+� 9� ? 6,+� CN,D� FY*� HDJL� O� S,U� FY*� HUWLY[� O� S,]� FY*� HY� _Yaceg� jSY� _YlWnp� jSY� _Yrctv� jSY� _Yxcz|� jSY� _Y~c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y�W��� jSY� _Y�c��� jSY	� _Y�c��� jSY
� _Y�c��� jSY� _Y����� jSY� _Y����� jS]WL��� O� S,�� FY*� HY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y����� jSY� _Y����� jS��L��� O� S,ƻ FY*� HY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y�c��� jSY� _Y����� jSY� _Y����� jS�WL��� O� S,ڻ FY*� HY� _Y��� jS�c~�� O� S+� � �� � W+� � �++�� �� �� � W+� � �+� � � ��+��� ��� � W+� �+� � � ��� � W+�� Z:�%�� O:� �:+� 9� ? W,� ,� � � � � � � � +�(W� ,+-�,������  %��! %��   �            �  : � +  ,  8  :  <  =  J $ K $ W $ Y $ [ $ \ $ ^ $ ` $ i � j � | � ~ � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � � �
 � � � � � �! �# �$ �& �4 �6 �8 �9 �; �I �K �M �N �P �^ ` b c e suxz� �� �� �� �� ���������������������������������������������������������������!�#�,u-u?wAwCwDwFwSxUxWxXxZxgyiykylyny{{}{{�{�{�|�|�|�|�|�}�}�}�}�}�~�~�~�~�~�����u�u�u�u�u�u�� ! ! ( 0 0 7 8 8 8 9 9 G G N N N N ] c c { { � � � � � � �      -. |  0�  �   �� � � +� 9�1�2 �� �� � �	+�5�8+�=� � W+�5�@+�=� � W+�5�C+�=� � W+�5�F� � W+�5�I� � W+�5�L�P� � W+�5�S� � W+�5�V� � W+�5�Y++�]�`�c �g�l�o� � W+�5�r+�=� � W++�u�y{��W9+� 9�Y�2 ��99�� � 6
�� � ��+���:+��Y����W9�O+��Y����W+++� 9�r����++�]�`�c +� 9�L�2 �����W++�u�y{++� 9�r�� ������W+++� 9�r����+�=��W+++� 9�r����+� 9�V�2 ��W+++� 9�r����++� 9����Y�+�u��S�Ķ�W+� 9�I+� 9�I�2 �+++� 9�r�� ���Ʋɶ����� W+++� 9�r�� ���ƲͶ��љ #+� 9�L�2 ��� � � � � y++� 9�8�2 �y+++� 9�r�� ���Ʋڶ��y��W+� 9�V++� 9�V�2 �++++� 9�r�� ���Ʋڶ��y���� W� �+++� 9�r�� ���ƲͶ��љ ?+++� 9�r�� �����y+++� 9�r�� ���Ʋڶ��y��W� *+� 9�F+++� 9�r�� ���ƲF���� W+++� 9�r�� �����y����++� 9�r�� �������� :++� 9��:� �+�
 � W++� 9�8�2 �y+� 9�S�2 ��� �+++� 9�8��+� 9�S�2 �++� 9�8�� +� 9�S�2 �����+++� 9�r�� ����+� 9�S�2 �����c�P�W+++� 9�r����+++� 9�r�� �����+++� 9�r�� �����+� 9�S�2 �����W� ���+� 9�"�P�� W� e++� 9�C�2 �y+++� 9�r�� �����+� 9�"�2 ���%'�*W+� 9�"+� 9�"�2 ��c�P�� W+� 9�"�2 +++� 9�r�� ������/��� � ��l� c9
� �� � � �� � ���++� 9�C�2 �y�6� � � �+� 9�C�2 ���� :++� 9��:� � a+�
 � W++� 9�8�2 �y+� 9�S�2 ��� )++� 9�8�2 �y+� 9�S�2 ��9W� ���� ++� 9�@�2 �y;+� 9�8�2 ��W++� 9�8�2 �y�6� � � (++� 9�F�2 ��>�� � � � � 9++� 9�@�2 �y@B��W++� 9�@�2 �yD��W� @++� 9�@�2 �y@'��W++� 9�@�2 �yD+� 9�F�2 ��W++� 9�@�2 �y�+� 9�I�2 ��W+++� 9�@�� �ɶ���>���+F�J�L:N�Q�T6�,+�X+Z�]+_�J�a:+�]�`�c �e�fW�i� �n�� :� �:+�r�����+t�]+�x+++� 9�@�� �ɶ���]� :� �:+�{�����+t�]+_�J�a:+� 9�8�2 �e�fW�i� �n�� :� �:+�r�����+}�]����� -:��� !: �  �:!� +��W���!������� �n�� :"� "�:#+�r�#����+++� 9�@����++� 9�r�� ������W� +� 9�@�2 ���� � ��+�5�r+�=� � W+�5�8+�=� � W+�5��+�=� � W+�5��++�]���c ����� � W+++� 9�8������W+++� 9�8�����P��W+++� 9�8���F��W:$+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r�������W� y:%%��� %�%�%:&&���� 8++� 9��:$$+&+��� W+++� 9�r����ö�W� &�� :'� '�:($� $+�� W�(����++� 9�r�� �����љ�++�]�ʹc �̸�θ�� � � \+++� 9�r����++�]�ʹc �̸ض�W+++� 9�r����++�]�ʹc ��̸ض�W� /+++� 9�r����ݶ�W+++� 9�r����߶�W+++� 9�r����+�]��c ��W+++� 9�r����++�]���c �����W+F�J�L:))��Q)�T6**�)+)*�X+�]+�x+�]+++� 9�r�� ������]+�]+++� 9�r�� ������]+��]+++� 9�r�� ������]+��]+�]���c ���� � � +�]� +�]++�]��c ��]+�]++�]��c ��]+�]++�]��c ��>�� '+�]++�]��c ��]+�]� +�]++++� 9�r�� ��Ʋ����>�� 5+�]++++� 9�r�� ��Ʋ����]+�]� +�]++++� 9�r�� ��Ʋ"����>�� 5+$�]++++� 9�r�� ��Ʋ"����]+&�]� +(�]++++� 9�r�� ��Ʋ+����]+-�]++++� 9�r�� ��Ʋ����>�� 5+�]++++� 9�r�� ��Ʋ����]+�]� +�]++++� 9�r�� ��Ʋ"����>�� 5+$�]++++� 9�r�� ��Ʋ"����]+&�]� +(�]++++� 9�r�� ��Ʋ+����]+/�]+++� 9�r�� ��Ʋ2���љ +4�]� +6�]+++� 9�r�� �ն���]+8�]+++�]���c �;����]+=�]+�]���c ���� � � '+?�]++�]���c ��]+A�]� +C�]+++� 9�r���F++� 9���2 �g�l�o��W+}�]9+++� 9�r�� �F����9-9//�� � 61/�� � ��+G��:22+��Y+����W+95�j2+��Y5����W+I�]+++� 9�r����++� 9���� +� 9�L�2 �����W+t�]+++� 9�r���O+++� 9�r�� ���ƲR����W+t�]97++� 9�r�� �O����999;;�� � 6=;�� � ��+G��:>>+��Y7����W79A�X>+��YA����W+T�]++�]�W�c ��]+Y�]+++� 9�r�� ���Ʋ\����� � � �+^�]+++� 9�r�� �۶���]+`�]++++� 9�r�� ���Ʋ\����]+b�]++++� 9�r�� ���Ʋe����]+g�]++++� 9�r�� ���Ʋj����]+l�]� +n�]+++� 9�r�� �ն���]+p�]++++� 9�r�� ���Ʋs����]+u�]A;c9A=� A9�� � � A9�� � ���+}�]5/c951� 5-�� � � 5-�� � ��w+w�]� :E� E�:F+�{�F����+�])����� -:G)G��� !:H� H�:I*� +��W)���I����)��� �n�� :J� J�:K+)�r�K����+y�J�{:LL�L���L���L��L+�]���c ����L��6MM� �+LM�X+��]+��J��:NN���N���N++� 9�r�� ������N��WN��� �n�� :O� O�:P+N�r�P����+��]L������ :Q� Q�:RM� +��W�R����L��� �n�� :S� S�:T+L�r�T����:U+++� 9�r����+++� 9���� ���������W+� 9��+++� 9�r�� ���Ʋ����� W+++� 9�r����++++� 9���� �ĶƲǶƲʶ���W++� 9�r�� ����@��� � ��+++� 9�8����+�=��W+++� 9�r����++� 9���2 ��Ӹض�W+++� 9�r����+++� 9�r�� �Ͷ��g�l�o��W+� 9���P�� W�+++� 9�r����++++++� 9�r�� �Ͷ�+� 9�޹2 ����Ʋ�Ʋ����W+++� 9�r����++++++� 9�r�� �Ͷ�+� 9�޹2 ����Ʋ��Ʋ����W+++� 9�8�� �ڶ��y++� 9�r�� ����++� 9�r�� �����W+� 9��+� 9�޹2 ��c�P�� W+� 9�޹2 ++� 9�r�� �۶���� � ���+++� 9�8�����P��W� >+++� 9�8���F+++++� 9���� �ĶƲ��Ʋ��Ʋ����W� y:VV��� V�V�%:WW���� 8++� 9��:UU+W+��� W+++� 9�8���F ��W� W�� :X� X�:YU� U+�� W�Y����+�]�ɹc �љ�+F�J�L:ZZ�QZ�T6[[�(+Z[�X+}�]+�x+�]++++� 9�r�� �������]+	�]+++++� 9���� �����+�����]+}�]� :\� \�:]+�{�]����+}�]+_�J�a:^^+� 9�8�2 �e^�fW^�i� �n�� :_� _�:`+^�r�`����+��]Z����� -:aZa��� !:b� b�:c[� +��WZ���c����Z��� �n�� :d� d�:e+Z�r�e����+++� 9�8����++� 9�r�� �ɶ���W� +�]��c �љ �++� 9���Y+++� 9�r�� �����$SY+� �� SY&S��W++� 9���Y++� 9���� ����SY+� �� SY(S��W� � +++� 9�8���F*��W+� 9�8�2 ���� � �t+�5�r+�=� � W+�5�-+�=� � W+�5��+�=� � W+++� 9�-������W+++� 9�-�����P��W+++� 9�-���F��W:f+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r�������W� y:gg��� g�g�%:hh���� 8++� 9��:ff+h+��� W+++� 9�r����ö�W� h�� :i� i�:jf� f+�� W�j����++� 9�r�� �����љ�+F�J�L:kk��Qk�T6ll� �+kl�X+�]+�x+/�]+++� 9�r�� ������]+1�]+++� 9�r�� �4����]+6�]+++� 9�r�� ������]+8�]++�]�;�c ��]+=�]� :m� m�:n+�{�n����+�]k����L� -:oko��� !:p� p�:ql� +��Wk���q����k��� �n�� :r� r�:s+k�r�s����+y�J�{:tt�t?��tA��t��6uu� �+tu�X+C�]+��J��:vv���v���v++� 9�r�� ������v��Wv��� �n�� :w� w�:x+v�r�x����+E�]t������ :y� y�:zu� +��W�z����t��� �n�� :{� {�:|+t�r�|����:}+++� 9�r����+++� 9���� ���������W+� 9��+++� 9�r�� ���Ʋ����� W+++� 9�r����++++� 9���� �ĶƲǶƲʶ���W++� 9�r�� ����@��� � � �+++� 9�r���H++� 9���� ������W+++� 9�-���K+�=��W+M�R� :+++� 9�-���K++++� 9�r�� �H�ƲU�ƲK����W� *+�Y� *+��� h:~~��� ~�~�%:���� '++� 9��:}}++��� W*+��� �� :�� ��:�}� }+�� W������+�]�ɹc �љ �+F�J�L:���Q��T6��� I+���X*+��������� -:������ !:�� ��:��� +��W������������� �n�� :�� ��:�+��r������+++� 9�-����++� 9�r�� �ɶ���W� *+��� *+��+� 9�-�2 �� \� � � *+��+� 9���2 �� :� � � -+++�]��c ���+� � � ����� � $���  ##  Kss  ���!���  ���  	�
{
{!	�
�
�  3��  (!(%%  WW  �  �;;  zhh  �::!���  �dd  ���  ���!���  �  �DD!���  
��  ���!���  ���  X��  E��  ��  CC!��  ���!�    � 5 5   �     At01 7}01 CX�01 D�  ��       * ? * A * A 1 A ; B ; B B B L C L C S C ] D ] D d D l E l E s E { G { G � G � H � H � H � K � K � K � N � N � N � N � N � N � Q � Q � Q � T � T � T � T � T � T � T � T � T � T � X � X � X � X% XT ZT [T [c [p [p [� ^� ^� ^� ^� ^� ^� ^� ^� ^� ^� a� a� a� b� b� b� e� e� e� e� e� e� e h h h h h% h% hK iK iK iK iK ik ik iw i� k� k� k� k� k� k� k� k� k� k� l� l� l� l� l� l� l� l� l� l� l� l n n n% p% p& p& p& p< p< p< pY pY pa sa sh s� v� v� v� v� v� v� v� w� w� w� w� x� x� x� x� x� x� x� x� x� x y y y y, y, y, y9 y9 yN yN yb yb y z z� z� z� z� z� z� z� z� z� z� z� z� z� z� ~� ~� ~� � � � � � � �          ( ( ( + + 0 ~7 ~7 ~7 ~F ~Q ~Q ~] ~^ ~^ ~^ ~� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � �  �  �  �5 �5 �6 �6 �6 �E �E �E �a �a �b �b �b �q �q �t �t �t �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� �� � � � � � � � � � � � � � � � �+ �+ �. �. �. �> �> �? �? �? �N �N �P �P �P �` �` �` �` �a �a �a �� �� �� �� �� � � � � �? �M �M �� �� �	 �	 �	 �	 �	8	8	8	?	I	I	P	Z	Z	a	k
	k
	r
	�	�	�	�	�	�	�	�	�	�	�	�	�	�	�
 
 



1
1
@
N
N
b
b
q
�
�
�
�
�
�
�
�
�
�         # 5!5!D!E!E!E!T!T!U!U!_"_"n"o"o"o"~"~"�"�"�%�%�%�&�&�&�)�)�)�*�*�*�///0:3;3;3T3U3[4\4\4u4v4|5}5}5�5�5�?�?�?�?�?�B�B�B�B�B�E�E�E�E�E I I I IIII I!I!I3I4IDKDKDKDKEKEKEKrKsKsK�K�K�L�L�L�L�L�L�L�L�L�L�L�LMMM%M&M,R,R,R,R-R-R-RZR[R[R{R|R�S�S�S�S�S�S�S�S�S�S�S�S�T�T�TTTUUUUEZFZFZ_Z`Zf\g\g\�\�\�^�^�^�^�^�_�_�_�_�_�b�b�b�b�b�b c ccc<crere�e�e�e�f�f�f�g�g�g�ggQjRjRjdjejklklklkl�l�o�o�o�o�o�q�q�q�q�q�r�r�rrrsss.s/s?x@x@xYxZx`zazaz�z�zn�����������������������������������������������
�
�
�
��/�/�>�F�F�U�V�V�V�e�e�o�o�~�����������������������'�'�O�O�P�P�P�f�f�f�|�|�|����������������������������N�Y�^�u�u����������������� ������%�&�&�'�'�'�(�(�(�>�>�A�A�A�D�D�E�E�N�N�������3�3�B�\�\�\�\�\�n�n�|�|�}�}�}��������������������������������������!�!�!�(�2�2�9�C�C�J�T�T�c�i�i�x���������������������������������	���+�+�:�X�c�h���������������������+�,�2�3�3�L�M�S�T�T�m�n�tuu��"*LZbjj55<\\k���������!�!�!�"�"�"�"�"�"�#�##WJbJgJ�Q�Q�Q�Q�R�R LY LY [Y u] ze }f �l �l �l �� �� �� � � � � � � � � � � � ��    ! VW |  � 
   �+[�R� �+++� 9�-���^++++++� 9�r�� �H�Ʋa�Ʋd�Ʋ�Ʋʶ���W+++� 9�-���g+++++� 9�r�� �H�Ʋa�Ʋg�Ʋʶ���W� +++� 9�-����+++++� 9�r�� �H�Ʋ�Ʋ�Ʋʶ���W+++� 9�-���j++++� 9�r�� �H�Ʋm�Ʋʶ���W+o�R� :+++� 9�-���r++++� 9�r�� �H�Ʋr�Ʋʶ���W� +t�R� :+++� 9�-���w++++� 9�r�� �H�Ʋw�Ʋʶ���W� +++� 9�r���z++++� 9�r�� �H�Ʋ}���g�l�o��W++� 9�r�� �z����� � ��+++� 9�-����+����W+� 9���P�� W��+++� 9�r����++++� 9�r�� �H�Ʋ}��+� 9�޹2 �����W++++� 9�-������+� 9�޹2 �+�=�W+��R� T+++++� 9�-������+� 9�޹2 �����++++� 9�r�� ���Ʋ��Ʋʶ���W� +��R� [+++++� 9�-������+� 9�޹2 �����+++++� 9�r�� ���Ʋ��Ʋ��Ʋʶ���W� +++++� 9�-������+� 9�޹2 �����+++� 9�r�� ��������ض�W+� 9��+� 9�޹2 ��c�P�� W+� 9�޹2 ++� 9�r�� �z����� � ��C� +++� 9�-�����P��W�   �  � l  %  %  %  % % % 
& 
& & L' L' [' �) �) �) �* �* �* �+ �+ �+ �+ �+ �+,,,:.:.:.:.;.;.D/D/S/{2{2�2�2�2�2�3�3�3�3�3�4�4�4�4�4�5�5�5666+6+6A7A7T7T7c7k8k8k8k8l8l8u9u9�9�9�9�;�;�;�;�;�;�<�<�<�<�<(?(?<?<?Q?R?R?R?h?h?r5y5y5y5�5�5�5�5�B�B�B�    ! �W |   \ 	    <+++� 9�-���F+++++� 9���� �ĶƲ��Ʋ��Ʋ����W�   �      F  F F�    ! �W |   7     +++� 9�-���F ��W�   �      K  K K�    ! �W |  ~ 	    �+}�]+�x+�]++++� 9�r�� �������]+��]+++++� 9���� �����+�����]+��]� M� ,�N+�{�����+}�]+_�J�a:+� 9�-�2 �e�fW�i� �n�� :� �:+�r�����+��]�   v v   � � �   �   z  S T T T T T T 7U 8U 8U 9U 9U 9U :U :U :U PU PU SU SU SU VU VU WU WU `U `U �W �W �W�    ! �W |   � 	    �+�]��c �љ y++� 9���Y++� 9���2 �$SY+� �� SY&S��W++� 9���Y++� 9���� ����SY+� �� SY(S��W� �   �   ^   ^  ^  ^  ^ _ _  _  _ !_ !_ !_ 3_ 3_ B_ B_ J` J` X` X` n` n` }` }`�    ! �W |   7     +++� 9�-���F���W�   �      g  g g�    ! �W |  /  +  
+�5�r+�=� � W+�5��+�=� � W+�5��+�=� � W+++� 9��������W+++� 9�������P��W+++� 9�������P��W+++� 9�����F��WM+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r����++� 9����Y+�]���c S����W+++� 9�r�������W� qN-��� -�-�%:���� 6++� 9��M,++��� W+++� 9�r����ö�W� �� :� �:,� ,+�� W�����++� 9�r�� �����љ0+F�J�L:��Q�T6		�&+	�X+�]+�x+/�]+++� 9�r�� ������]+1�]+++� 9�r�� �4����]+6�]+++� 9�r�� ������]+��]++�]��c ��]+��]++�]���c ��]+ö]++�]�ƹc ��]+ȶ]� :
� 
�:+�{�����+�]����� -:��� !:� �:	� +��W���������� �n�� :� �:+�r�����+y�J�{:�ʶ�A����6� �+�X+E�]+��J��:������++� 9�r�� ��������W��� �n�� :� �:+�r�����+̶]������ :� �:� +��W�������� �n�� :� �:+�r�����:+++� 9�r����+++� 9���� ���������W+� 9��+++� 9�r�� ���Ʋ����� W+++� 9�r����++++� 9���� �ĶƲǶƲʶ���W++� 9�r�� ����@��� � ��+++� 9�r����++++� 9���� �϶ƲҶƲն���W++� 9�r�� ������� � � +++� 9�������P��W�/+++� 9�r����+++� 9���� �϶��g�l�o��W+++� 9�r����+����W+� 9���P�� W�++++� 9�r���۶�+� 9�޹2 �+�=�W+++++� 9�r���۶�+� 9�޹2 �����++++++� 9���� �϶�+� 9�޹2 ���K�Ʋ�Ʋն���W+++++� 9�r���۶�+� 9�޹2 �����++++++� 9���� �϶�+� 9�޹2 ���K�Ʋ�Ʋն���W+++++� 9�r���۶�+� 9�޹2 �����+++++� 9���� �϶�+� 9�޹2 ����Ʋն���W+� 9��+� 9�޹2 ��c�P�� W+� 9�޹2 ++� 9�r�� �ض���� � ��Y+++� 9������++� 9�r�� �۶���W+++� 9�������P��W� >+++� 9�����F+++++� 9���� �ĶƲ��Ʋ��Ʋ����W� y:��� ��%:���� 8++� 9��:++��� W+++� 9�����F ��W� �� :� �:� +�� W�����+�]�ɹc �љ�+F�J�L:�Q�T6  �(+ �X+}�]+�x+�]++++� 9�r�� �������]+	�]+++++� 9���� �����+�����]+}�]� :!� !�:"+�{�"����+}�]+_�J�a:##+� 9���2 �e#�fW#�i� �n�� :$� $�:%+#�r�%����+��]����� -:&&��� !:'� '�:( � +��W���(������� �n�� :)� )�:*+�r�*����+++� 9������++� 9�r�� �ɶ���W� � +++� 9�����F��W�  �99! ���  ���  ���!���  �  y��  f��  ;  )��!)%%  ���  		E	E  	o	o!	{	{  b	�	�   �  � �  �  �  � � � � � "� "� )� 3� 3� B� H� H� W� _� _� n� v� v� �� �� �� �� �� �� �� �� �� �� �� �� �� �� ���� � �/�I�T�Y�n�n�}������������������������ � �9�:�@�A�A�Z�[�a�b�b�t�u�{�|�|���������������/�C�K�m�{�������&�&�)�)�8�9�9�9�V�V�]�}�}�������������������
�
�
�
��-�-�<�G�G�V�W�W�W�w�w�����������������������������������5�5�I�I�^�u�u�����������������������+�M�M�\�s�s������������������D�D�D�D�V�d�������������������������������������������������������	�	�	�	��	��	��	��	��	��	��	���    ! �� |      �� � � ��o� � � ��]� � �� � � 	�� �� � � 	�� �� � � 
��� �� � � 
��� �� � � 
��� �� � � 
��� �� � � 
��� y� � � �� f� � � �� S	� � � �� @
� � � �� -� � � 
��� � � � 
��� �L� � � v� � � �� a� � � �� O� � � �� =� � � �� +� � � 
��� � � � 
��� � �� � � �� � � �� �� � � �� u� � � �� c� � � �� Q� � � �� ?� � � �� -� � � 
��� � � � 
��� � &� � � � � � 	�� � �   �   r  > � > � Q � Q � d � d � x � x � � � � � � � � � � � � �  ++��������<~<~QQuu�       !v |        *��     v |  *    :�
� ��
� ��
��
��
�1�
�8�
�@�
�C�
�F�
�I��
�L��
�S�
�V�
�Y!�
�`#�
�r%�
��'�
��)�
��+�
��-�
����
��@�
��;�
��/�
�"1�
��3�
��5�
����
��7�
��9�
����
��;�
����
����
��=�
����
��?�
��A�
��C�
��E�
��G�
��I�
����
��r�
�x�
�a�
�ȸ
�K�
�"M�
�+O�
�2Q�
�;S�
�FG�
�LU�
�OW�
�R~�
�WY�
�\[�
�e]�
�j_�
�s��
��a�
��c�
��e�
��g�
��i�
��k�
��m�
��o�
��q�
��s�
��u�
��w�
��y�
��{�
��}�
���
����
����
����
����
����
����
���
���
�-��
�4��
�;��
�H��
�K��
�U��
�^��
�a��
�d��
�g��
�j��
�m��
�r��
�w��
�z��
�}��
����
����
����
����
����
����
����
��̸
��и
����
����
����
��ø
��Ÿ
��Ǹ
��ɸ
��˸
��͸
��ϸ
��ܸ
��   �  � w    	      $  - A 6 B ? C H D Q E Z G c H l K u N ~ N � Q � [ � a � b � e � h � i � k � ~ � � � �
 �

&.6? G!P"Y)b)k*t*}?�B�E�I�K�L�M�U�\�b�e�f�f�j�l�rsz�!�*�3�<�E�N�W�`�i�r�{���������������������������
!#%&.&7&@'I*R*[,d/m2v26�9�<�<�<�?����������������������(�1 �    