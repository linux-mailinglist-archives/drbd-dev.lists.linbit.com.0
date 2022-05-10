Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0E4521368
	for <lists+drbd-dev@lfdr.de>; Tue, 10 May 2022 13:16:45 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 631A9420621;
	Tue, 10 May 2022 13:16:44 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id A2F444203EF
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 13:16:43 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id E538056014B;
	Tue, 10 May 2022 19:16:40 +0800 (CST)
Message-ID: <AAsAIAC8IfSaXGMbJbgsMKpG.1.1652181400930.Hmail.rui.xu@easystack.cn>
To: joel.colledge@linbit.com
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Tue, 10 May 2022 19:16:40 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Tue, 10 May 2022 19:16:40 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUIfQhpWQ0JIShpNQhhJTU
	MeVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktITUpVS1kG
X-HM-Sender-Digest: e1kMHhlZQQ8JDh5XWRIfHhUPWUFZRzo6CDoyOjhDMh0oGiM8NhkxGRwI
	NjALPFVKVUpNTklKQ0pPS0pKS09VMxYaEhdVCQ4SVQMOOx4aCAIIDxoYEFUYFUVZV1kSC1lBWUlK
	Q1VCT1VKSkNVQktZV1kIAVlBT05DTjcG
X-HM-Tid: 0a80adaf7d628c39kuqt180949614a8
Cc: philipp.reisner@linbit.com, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] =?utf-8?q?drbd=3A_a_proposal_of_two-primaries_mode?=
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
Content-Type: multipart/mixed; boundary="===============1687074879913185432=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============1687074879913185432==
Content-Type: multipart/alternative; BOUNDARY="=_Part_352940_763854113.1652181400930"

--=_Part_352940_763854113.1652181400930
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgpJIGhhdmUgbWV0IHNvbWUgcHJvYmxlbXMgd2l0aCBjb21taXQgZTAxMjAwZTAs
IHRoZSBjb21taXQgaGFzIHJlbW92ZSB0d28tcHJpbWFyaWVzCndyaXRlIGNvbmZsaWN0IHJlc29s
dXRpb24uCgoKSW4gbXkgdXNlLWNhc2UsIHR3by1wcmltYXJpZXMgY29uZmlndXJhdGlvbiBpcyBy
ZXF1aXJlZCwgYnV0IGNvbmZsaWN0aW5nIHdyaXRlcyBtYXkgaGFwcGVucwphbmQgaXQgaXMgaW5l
dml0YWJsZS4gV2hlbiBjb25mbGljdGluZyB3cml0ZXMgaGFwcGVuLCByZWNvbm5lY3Rpb24gd2ls
bCBiZSB0cmlnZ2VyZWQuIFNpbmNlIGNvbmZsaWN0aW5nCndyaXRlcyB3aWxsIG5vdCBiZSBkaXNj
YXJkZWQsIHJlY29ubmVjdGlvbiB3aWxsIGJlIHRyaWdnZXJlZCBhZ2FpbiBhbmQgYWdhaW4sIHdo
aWNoIGxlYWQgdGhlIGRyYmQgdG8KYmVjb21lIHVuYXZhaWxhYmxlLgoKCgpJbiBjb21taXQgZTAx
MjAwZTAsIHlvdSBzYWlkIHRoYXQgJ2FueW9uZSB1c2luZyB0d28tcHJpbWFyaWVzIHNob3VsZCBl
bnN1cmUgdGhhdCB0aGV5IGRvIG5vdCBzdWJtaXQKY29uZmxpY3Rpbmcgd3JpdGVzJywgYnV0IGkg
ZG9uJ3QgdGhpbmsgd2Ugc2hvdWxkIGFzc3VtZSB0aGUgYmVoYXZpb3Igb2YgdGhlIHVwcGVyIGxh
eWVyLiBJIHRoaW5rIHdlIHNob3VsZApkZWFsIHdpdGggaXQgcmF0aGVyIHRoYW4gaWdub3JlIGl0
IHRvIGVuc3VyZSB0aGF0IHRoZSBkcmJkIGNhbiBjb250aW51ZSB0byB3b3JrLgoKCkFzIGZvciB0
aGUgcXVlc3Rpb24geW91IG1lbnRpb25lZCwgIEkgaGF2ZSBzb21lIGlkZWFzIGFib3V0IHNvbHZp
bmcgdGhlc2UgcHJvYmxlbXMsIHdlIGNhbiBkaXNjdXNzCml0IGxhdGVyLgoKCgpCZXN0IHJlZ2Fy
ZHMsClh1CgoKCgoKDQoNCg==
--=_Part_352940_763854113.1652181400930
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+SSBoYXZlIG1ldCBzb21lIHByb2JsZW1zIHdpdGggY29tbWl0IGUwMTIwMGUwLCB0aGUgY29t
bWl0IGhhcyByZW1vdmUgdHdvLXByaW1hcmllczwvZGl2PjxkaXY+d3JpdGUgY29uZmxpY3QgcmVz
b2x1dGlvbi48L2Rpdj48ZGl2PjxiciAvPjwvZGl2PjxkaXY+SW4gbXkgdXNlLWNhc2UsIHR3by1w
cmltYXJpZXMgY29uZmlndXJhdGlvbiBpcyByZXF1aXJlZCwgYnV0IGNvbmZsaWN0aW5nIHdyaXRl
cyBtYXkgaGFwcGVuczwvZGl2PjxkaXY+YW5kIGl0IGlzIGluZXZpdGFibGUuIFdoZW4gY29uZmxp
Y3Rpbmcgd3JpdGVzIGhhcHBlbiwgcmVjb25uZWN0aW9uIHdpbGwgYmUgdHJpZ2dlcmVkLiBTaW5j
ZSBjb25mbGljdGluZzwvZGl2PjxkaXY+d3JpdGVzIHdpbGwgbm90IGJlIGRpc2NhcmRlZCwgcmVj
b25uZWN0aW9uIHdpbGwgYmUgdHJpZ2dlcmVkIGFnYWluIGFuZCBhZ2Fpbiwgd2hpY2ggbGVhZCB0
aGUgZHJiZCB0bzwvZGl2PjxkaXY+YmVjb21lIHVuYXZhaWxhYmxlLjxiciAvPjwvZGl2PjxkaXY+
PGJyIC8+PC9kaXY+PGRpdj5JbiBjb21taXQgZTAxMjAwZTAsIHlvdSBzYWlkIHRoYXQgJ2FueW9u
ZSB1c2luZyB0d28tcHJpbWFyaWVzIHNob3VsZCBlbnN1cmUgdGhhdCB0aGV5IGRvIG5vdCBzdWJt
aXQ8L2Rpdj48ZGl2PmNvbmZsaWN0aW5nIHdyaXRlcycsIGJ1dCBpIGRvbid0IHRoaW5rIHdlIHNo
b3VsZCBhc3N1bWUgdGhlIGJlaGF2aW9yIG9mIHRoZSB1cHBlciBsYXllci4gSSB0aGluayB3ZSBz
aG91bGQ8L2Rpdj48ZGl2PmRlYWwgd2l0aCBpdCByYXRoZXIgdGhhbiBpZ25vcmUgaXQgdG8gZW5z
dXJlIHRoYXQgdGhlIGRyYmQgY2FuIGNvbnRpbnVlIHRvIHdvcmsuPC9kaXY+PGRpdj48c3BhbiBj
bGFzcz0iIj48YnIgLz48L3NwYW4+PC9kaXY+PGRpdj5BcyBmb3IgdGhlIHF1ZXN0aW9uIHlvdSBt
ZW50aW9uZWQsJm5ic3A7IDxzcGFuIGNsYXNzPSIiPkkgaGF2ZSBzb21lIGlkZWFzIGFib3V0IHNv
bHZpbmcgdGhlc2UgcHJvYmxlbXMsIHdlIGNhbiBkaXNjdXNzPC9zcGFuPjwvZGl2PjxkaXY+PHNw
YW4gY2xhc3M9IiI+aXQgbGF0ZXIuPGJyIC8+PC9zcGFuPjwvZGl2PjxkaXY+PGJyIC8+PC9kaXY+
PGRpdj5CZXN0IHJlZ2FyZHMsPC9kaXY+PGRpdj5YdTxiciAvPjwvZGl2PjxkaXY+PGJyIC8+PC9k
aXY+PC9kaXY+PGJyPg==
--=_Part_352940_763854113.1652181400930--

--===============1687074879913185432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============1687074879913185432==--
