Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 23ECE574DE6
	for <lists+drbd-dev@lfdr.de>; Thu, 14 Jul 2022 14:41:44 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 1D583420FBA;
	Thu, 14 Jul 2022 14:41:42 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 307 seconds by postgrey-1.31 at mail19;
	Thu, 14 Jul 2022 14:41:40 CEST
Received: from mail-m2823.qiye.163.com (mail-m2823.qiye.163.com [103.74.28.23])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 9391542097A
	for <drbd-dev@lists.linbit.com>; Thu, 14 Jul 2022 14:41:40 +0200 (CEST)
Received: from easystack.cn (unknown [127.0.0.1])
	by mail-m2823.qiye.163.com (Hmail) with ESMTP id F109AD800C9;
	Thu, 14 Jul 2022 20:36:19 +0800 (CST)
Message-ID: <AL*AywBKImqCcBd6mgBHvKqI.1.1657802179974.Hmail.rui.xu@easystack.cn>
To: joel.colledge@linbit.com
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Thu, 14 Jul 2022 20:36:19 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Thu, 14 Jul 2022 20:36:19 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVlCTxlLVkNLSR8dT0odGh5KSlUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpKS0hNSlVLWQY+
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo3UToCDDkwMhYKOBg5H00WHDkz
	DTAKMlVKVUpNTkxDS0lKQ0tJTkJVMxYaEhdVCQ4SVQMOOx4aCAIIDxoYEFUYFUVZV1kSC1lBWUlK
	Q1VCT1VKSkNVQktZV1kIAVlBT05DQzcG
X-HM-Tid: 0a81fcb5c5848411kuqw181f7822e79
Cc: philipp.reisner@linbit.com, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] =?utf-8?q?drbd=3A_a_question_of_uuid_compare?=
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
Content-Type: multipart/mixed; boundary="===============6350462424891764871=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============6350462424891764871==
Content-Type: multipart/alternative; BOUNDARY="=_Part_7996_1986501302.1657802179974"

--=_Part_7996_1986501302.1657802179974
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgogSSBoYXZlIG1ldCBzb21lIHByb2JsZW1zIHdpdGggY29tbWl0IDMwMGJmYjdi
YSwgIHRoZSBjb21taXQgbW92ZSBydWxlICJyZWNvbm5lY3QiIGluIGZyb250IG9mIHJ1bGUKICJs
b3N0X3F1b3J1bSIgaW4gZHJiZF91dWlkX2NvbXBhcmUuCgoKSSBoYXZlIGEgMiBub2RlIGNsdXN0
ZXIgYW5kIGFsbCAyIG5vZGVzIHJ1bm5pbmcgd2l0aCBEUkJEOS4xOiBQcmltYXJ5IG5vZGUgaXMg
bm9kZS0xLCAgYW5kIFNlY29uZGFyeQoKbm9kZSBpcyBub2RlLTIgLCBxdW9ydW0gaXMgY29uZmln
dXJlZCBhcyAyLgoKCk15IHByb2JsZW0gY2FuIGJlIHJlcHJvZHVjZWQgYXMgZm9sbG93czoKMS4g
bm9kZS0xIGNyYXNoIHdoZW4gaW8gaXMgb25naW5nLgoyLiBub2RlLTEgcmVjb3ZlcnkgYW5kIHJl
Y29ubmVjdCB3aXRoIG5vZGUtMihhIGZ1bGwgc3luYyBpcyByZXF1aXJlZCkuCjMuIG5vZGUtMiBi
ZWNvbWVzIFdGQml0TWFwUyBhbmQgbm9kZS0xIGJlY29tZXMgV0ZCaXRNYXBULgo0LiBub2RlLTEg
bG9zdCBjb25uZWN0aW9uIHdpdGggbm9kZS0yICwgYnV0IG5vZGUgMSBoYXMgbm90IHNlbnQgYSBi
aXRtYXAgdG8gbm9kZSAyIGF0IHRoaXMgdGltZS4KNS4gbm9kZS0xIHJlY29ubmVjdCB3aXRoIG5v
ZGUtMi4KCk5vIHJlc3luYyB3aWxsIGJlIHRyaWdnZXJlZCBkdWUgdG8gdGhlIGNvbW1pdCAzMDBi
ZmI3YmEgLCB0aGlzIHdpbGwgY2F1c2UgdGhlIGRhdGEgb2YgdGhlIHR3byBub2RlcyB0byBiZSBp
bmNvbnNpc3RlbnQuCgoKU28gY2FuIHlvdSB0ZWxsIG1lIHRoZSBwdXJwb3NlIG9mIHRoaXMgY29t
bWl0IGFuZCBtb3JlIGRldGFpbHMgYWJvdXQgdGhpcyBjb21taXQuCgoKCkJlc3QgcmVnYXJkcywK
WHUKCgoNCg0K
--=_Part_7996_1986501302.1657802179974
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2
PiZuYnNwO0kgaGF2ZSBtZXQgc29tZSBwcm9ibGVtcyB3aXRoIGNvbW1pdCAzMDBiZmI3YmEsJm5i
c3A7IHRoZSBjb21taXQgbW92ZSBydWxlICJyZWNvbm5lY3QiIGluIGZyb250IG9mIHJ1bGU8L2Rp
dj48ZGl2PiZuYnNwOyJsb3N0X3F1b3J1bSIgaW4gZHJiZF91dWlkX2NvbXBhcmUuPC9kaXY+PGRp
dj48YnI+PC9kaXY+PGRpdj5JIGhhdmUgYSAyIG5vZGUgY2x1c3RlciBhbmQgYWxsIDIgbm9kZXMg
cnVubmluZyB3aXRoIERSQkQ5LjE6IFByaW1hcnkgbm9kZSBpcyBub2RlLTEsJm5ic3A7IGFuZCBT
ZWNvbmRhcnkgPGJyPjwvZGl2PjxkaXY+bm9kZSBpcyBub2RlLTIgLCBxdW9ydW0gaXMgY29uZmln
dXJlZCBhcyAyLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+TXkgcHJvYmxlbSBjYW4gYmUgcmVw
cm9kdWNlZCBhcyBmb2xsb3dzOjwvZGl2PjxkaXY+MS4gbm9kZS0xIGNyYXNoIHdoZW4gaW8gaXMg
b25naW5nLjwvZGl2PjxkaXY+Mi4gbm9kZS0xIHJlY292ZXJ5IGFuZCByZWNvbm5lY3Qgd2l0aCBu
b2RlLTIoYSBmdWxsIHN5bmMgaXMgcmVxdWlyZWQpLjwvZGl2PjxkaXY+My4gbm9kZS0yIGJlY29t
ZXMgV0ZCaXRNYXBTIGFuZCBub2RlLTEgYmVjb21lcyBXRkJpdE1hcFQuPC9kaXY+PGRpdj40LiBu
b2RlLTEgbG9zdCBjb25uZWN0aW9uIHdpdGggbm9kZS0yICwgPHNwYW4gY2xhc3M9IiI+YnV0IG5v
ZGUgMSBoYXMgbm90IHNlbnQgYSBiaXRtYXAgdG8gbm9kZSAyIGF0IHRoaXMgdGltZS48L3NwYW4+
PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iIj41LiBub2RlLTEgcmVjb25uZWN0IHdpdGggbm9kZS0y
Ljxicj48L3NwYW4+PC9kaXY+PGRpdj5ObyByZXN5bmMgd2lsbCBiZSB0cmlnZ2VyZWQgZHVlIHRv
IHRoZSBjb21taXQgMzAwYmZiN2JhICwgdGhpcyB3aWxsIDxzcGFuIGNsYXNzPSIiPmNhdXNlIHRo
ZSBkYXRhIG9mIHRoZSB0d28gbm9kZXMgdG8gYmUgaW5jb25zaXN0ZW50Ljwvc3Bhbj48L2Rpdj48
ZGl2PjxzcGFuIGNsYXNzPSIiPjxicj48L3NwYW4+PC9kaXY+PGRpdj48c3BhbiBjbGFzcz0iIj5T
byBjYW4geW91IHRlbGwgbWUgdGhlIHB1cnBvc2Ugb2YgdGhpcyBjb21taXQgYW5kIG1vcmUgZGV0
YWlscyBhYm91dCB0aGlzIGNvbW1pdC48YnI+PC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2Pjxk
aXY+QmVzdCByZWdhcmRzLDwvZGl2Plh1PHA+PC9wPjwvZGl2Pjxicj4=
--=_Part_7996_1986501302.1657802179974--

--===============6350462424891764871==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============6350462424891764871==--
