Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id D62FC40675E
	for <lists+drbd-dev@lfdr.de>; Fri, 10 Sep 2021 08:46:10 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A001542061D;
	Fri, 10 Sep 2021 08:46:09 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id F2DE84201F1
	for <drbd-dev@lists.linbit.com>; Fri, 10 Sep 2021 08:46:08 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id 7491F560173;
	Fri, 10 Sep 2021 14:46:02 +0800 (CST)
Message-ID: <AKkA4ACFH9bqOVHHhqflEKqv.3.1631256362463.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+U3-BZ+9uykZuttOp6+irG15yesyFfDs27kj3M6BJN+1A@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Fri, 10 Sep 2021 14:46:02 +0800 (GMT+08:00)
From: =?UTF-8?B?5b6Q6ZSQ?= <rui.xu@easystack.cn>
Date: Fri, 10 Sep 2021 14:46:02 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRkaTUtWQk5CQk5OTR8ZTk
	ofVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpITUNMQ0NISkNNTDdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjAQOk86OD0zQhkKNC0zMxMKHRc#MAoNVUhVSk1ISklOTUhNSUxJTFUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFNQ0JMNwY+
X-HM-Tid: 0a7bce74bdf18c39kuqt7491f560173
Cc: Philipp Reisner <philipp.reisner@linbit.com>,
	=?UTF-8?B?5p2o5Lic5Y2H?= <dongsheng.yang@easystack.cn>,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_do_not_finish_the_stable?=
	=?utf-8?q?_resync_when_repl_state_is_L=5FPAUSED=5FSYNC=5FT?=
X-BeenThere: drbd-dev@lists.linbit.com
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: "*Coordination* of development, patches,
	contributions -- *Questions* \(even to developers\) go to drbd-user,
	please." <drbd-dev.lists.linbit.com>
List-Unsubscribe: <https://lists.linbit.com/mailman/options/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=unsubscribe>
List-Archive: <http://lists.linbit.com/pipermail/drbd-dev>
List-Post: <mailto:drbd-dev@lists.linbit.com>
List-Help: <mailto:drbd-dev-request@lists.linbit.com?subject=help>
List-Subscribe: <https://lists.linbit.com/mailman/listinfo/drbd-dev>,
	<mailto:drbd-dev-request@lists.linbit.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8777920865433388636=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============8777920865433388636==
Content-Type: multipart/alternative; BOUNDARY="=_Part_630298_2137994971.1631256362463"

--=_Part_630298_2137994971.1631256362463
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKSSdtIHNvcnJ5IHRoZXJlIHdlcmUgc29tZSBmb3JtYXQgcHJvYmxlbXMgaW4gbXkg
bGFzdCBlbWFpbC4KClRoYW5rcyBmb3IgdGhlIHJlcGx5IGFuZCBzb3JyeSBmb3IgdGhlIGRlbGF5
LiBBZnRlciBzb21lIG1vcmUgaW52ZXN0aWdhdGlvbiwgSSBmb3VuZCB0aGUgcm9vdCBjYXVzZQoK
b2YgdGhpcyBwcm9ibGVtIHdlIG1ldCBpcyB0aGF0IHRoZXJlIGlzIGEgcmFjZSBjb25kaXRpb24g
aW4gdXBkYXRlX3N5bmNfYml0cygpIGFuZCByZWNlaXZlX2JpdG1hcCgpLgpUaGlzIHJhY2UgY29u
ZGl0aW9uIHdpbGwgbGVhZCB0aGUgcHJvYmxlbSBJIHdhcyB0cnlpbmcgdG8gc29sdmUgaW4gdGhp
cyBwYXRjaCBhYm92ZS4KCgpXZSBjb25maXJtZWQgdGhlIHJhY2UgY29uZGl0aW9uIGV4aXN0aW5n
IGluIHVwc3RyZWFtIGFuZCBJIGhhdmUgc2VudCBhIHBhdGNoIGZvciBpdDoKaHR0cHM6Ly9saXN0
cy5saW5iaXQuY29tL3BpcGVybWFpbC9kcmJkLWRldi8yMDIxLVNlcHRlbWJlci8wMDU4NDAuaHRt
bAoKClNvIHlvdSBjYW4gZ28gdG8gcmV2aWV3IG15IG5ldyBwYXRjaCBkaXJlY3RseS4KVGhhbmtz
LApYdQoKCgoKCgoKCkZyb206IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNv
bT4KRGF0ZTogMjAyMS0wOS0wMSAxNjo0MDozMgpUbzogIFJ1aSBYdSA8cnVpLnh1QGVhc3lzdGFj
ay5jbj4KQ2M6ICBQaGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPixk
cmJkLWRldkBsaXN0cy5saW5iaXQuY29tClN1YmplY3Q6IFJlOiBbRHJiZC1kZXZdIFtQQVRDSF0g
ZHJiZDogZG8gbm90IGZpbmlzaCB0aGUgc3RhYmxlIHJlc3luYyB3aGVuIHJlcGwgc3RhdGUgaXMg
TF9QQVVTRURfU1lOQ19UPkhpLAo+Cj5UaGFua3MgZm9yIHRoZSBjb250cmlidXRpb24uIFBsZWFz
ZSBkZXNjcmliZSB0aGUgc3RlcHMgbmVjZXNzYXJ5IHRvCj5yZXByb2R1Y2UgdGhlIGlzc3VlLiBJ
IHRyaWVkIGJyaWVmbHkgdG8gcmVwcm9kdWNlIGl0IHdpdGhvdXQgc3VjY2VzczsKPmdldHRpbmcg
YSBwYXVzZWQgc3luYyB0byBmaW5pc2ggYmVmb3JlIGEgcnVubmluZyBvbmUgaXMgbm90IHRoYXQg
ZWFzeS4KPkEgdGVzdCBpbiBodHRwczovL2dpdGh1Yi5jb20vTElOQklUL2RyYmQ5LXRlc3RzIHdv
dWxkIGJlIGlkZWFsLCBidXQgYQo+d3JpdHRlbiBkZXNjcmlwdGlvbiBpcyBPSyB0b28uCj4KPlBs
ZWFzZSBhbHNvIHZlcmlmeSB0aGF0IHRoZSBpc3N1ZSBvY2N1cnMgb24gdGhlIGxhdGVzdCBkcmJk
LTkuMCBvcgo+bWFzdGVyIGJyYW5jaC4gSSBzZWUgZnJvbSB0aGUgcGF0Y2ggdGhhdCB5b3UgYXJl
IHdvcmtpbmcgb24gYSB2ZXJzaW9uCj50aGF0IGlzIGF0IGxlYXN0IGEgY291cGxlIG9mIG1vbnRo
cyBvbGQuCj4KPkJlc3QgcmVnYXJkcywKPkpvZWwKCgoNCg0K
--=_Part_630298_2137994971.1631256362463
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PkknbSBzb3JyeSB0aGVy
ZSB3ZXJlIHNvbWUgZm9ybWF0IHByb2JsZW1zIGluIG15IGxhc3QgZW1haWwuPGJyIC8+PC9kaXY+
PGRpdj5UaGFua3MgZm9yIHRoZSByZXBseSBhbmQgc29ycnkgZm9yIHRoZSBkZWxheS4gQWZ0ZXIg
c29tZSBtb3JlIGludmVzdGlnYXRpb24sIEkgZm91bmQgdGhlIHJvb3QgY2F1c2UgPGJyIC8+PC9k
aXY+PGRpdj5vZiB0aGlzIHByb2JsZW0gd2UgbWV0IGlzIHRoYXQgdGhlcmUgaXMgYSByYWNlIGNv
bmRpdGlvbiBpbiB1cGRhdGVfc3luY19iaXRzKCkgYW5kIHJlY2VpdmVfYml0bWFwKCkuPC9kaXY+
PGRpdj5UaGlzIHJhY2UgY29uZGl0aW9uIHdpbGwgbGVhZCB0aGUgcHJvYmxlbSBJIHdhcyB0cnlp
bmcgdG8gc29sdmUgaW4gdGhpcyBwYXRjaCBhYm92ZS48L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+V2UgY29uZmlybWVkIHRoZSByYWNlIGNvbmRpdGlvbiBleGlzdGluZyBpbiB1cHN0cmVhbSBh
bmQgSSBoYXZlIHNlbnQgYSBwYXRjaCBmb3IgaXQ6PC9kaXY+PGRpdj48YSBocmVmPSJodHRwczov
L2xpc3RzLmxpbmJpdC5jb20vcGlwZXJtYWlsL2RyYmQtZGV2LzIwMjEtU2VwdGVtYmVyLzAwNTg0
MC5odG1sIiBfc3JjPSJodHRwczovL2xpc3RzLmxpbmJpdC5jb20vcGlwZXJtYWlsL2RyYmQtZGV2
LzIwMjEtU2VwdGVtYmVyLzAwNTg0MC5odG1sIj5odHRwczovL2xpc3RzLmxpbmJpdC5jb20vcGlw
ZXJtYWlsL2RyYmQtZGV2LzIwMjEtU2VwdGVtYmVyLzAwNTg0MC5odG1sPC9hPjwvZGl2PjxkaXY+
PGJyIC8+PC9kaXY+PGRpdj4gU28geW91IGNhbiBnbyB0byByZXZpZXcgbXkgbmV3IHBhdGNoIGRp
cmVjdGx5LjwvZGl2PjxkaXY+VGhhbmtzLDwvZGl2PjxkaXY+WHU8L2Rpdj48YnIgLz48YnIgLz48
YnIgLz48YnIgLz48YnIgLz48ZGl2ICBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7em9vbToxIj48
L2Rpdj48YnIgLz48cHJlPjxiciAvPkZyb206IEpvZWwgQ29sbGVkZ2UgJmx0O2pvZWwuY29sbGVk
Z2VAbGluYml0LmNvbSZndDsKRGF0ZTogMjAyMS0wOS0wMSAxNjo0MDozMgpUbzogIFJ1aSBYdSAm
bHQ7cnVpLnh1QGVhc3lzdGFjay5jbiZndDsKQ2M6ICBQaGlsaXBwIFJlaXNuZXIgJmx0O3BoaWxp
cHAucmVpc25lckBsaW5iaXQuY29tJmd0OyxkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tClN1Ympl
Y3Q6IFJlOiBbRHJiZC1kZXZdIFtQQVRDSF0gZHJiZDogZG8gbm90IGZpbmlzaCB0aGUgc3RhYmxl
IHJlc3luYyB3aGVuIHJlcGwgc3RhdGUgaXMgTF9QQVVTRURfU1lOQ19UJmd0O0hpLAomZ3Q7CiZn
dDtUaGFua3MgZm9yIHRoZSBjb250cmlidXRpb24uIFBsZWFzZSBkZXNjcmliZSB0aGUgc3RlcHMg
bmVjZXNzYXJ5IHRvCiZndDtyZXByb2R1Y2UgdGhlIGlzc3VlLiBJIHRyaWVkIGJyaWVmbHkgdG8g
cmVwcm9kdWNlIGl0IHdpdGhvdXQgc3VjY2VzczsKJmd0O2dldHRpbmcgYSBwYXVzZWQgc3luYyB0
byBmaW5pc2ggYmVmb3JlIGEgcnVubmluZyBvbmUgaXMgbm90IHRoYXQgZWFzeS4KJmd0O0EgdGVz
dCBpbiBodHRwczovL2dpdGh1Yi5jb20vTElOQklUL2RyYmQ5LXRlc3RzIHdvdWxkIGJlIGlkZWFs
LCBidXQgYQomZ3Q7d3JpdHRlbiBkZXNjcmlwdGlvbiBpcyBPSyB0b28uCiZndDsKJmd0O1BsZWFz
ZSBhbHNvIHZlcmlmeSB0aGF0IHRoZSBpc3N1ZSBvY2N1cnMgb24gdGhlIGxhdGVzdCBkcmJkLTku
MCBvcgomZ3Q7bWFzdGVyIGJyYW5jaC4gSSBzZWUgZnJvbSB0aGUgcGF0Y2ggdGhhdCB5b3UgYXJl
IHdvcmtpbmcgb24gYSB2ZXJzaW9uCiZndDt0aGF0IGlzIGF0IGxlYXN0IGEgY291cGxlIG9mIG1v
bnRocyBvbGQuCiZndDsKJmd0O0Jlc3QgcmVnYXJkcywKJmd0O0pvZWwKPC9wcmU+PC9kaXY+PGJy
Pg==
--=_Part_630298_2137994971.1631256362463--

--===============8777920865433388636==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============8777920865433388636==--
