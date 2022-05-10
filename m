Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE035214DB
	for <lists+drbd-dev@lfdr.de>; Tue, 10 May 2022 14:10:38 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id BF4A0420621;
	Tue, 10 May 2022 14:10:37 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4D26B4203EF
	for <drbd-dev@lists.linbit.com>; Tue, 10 May 2022 14:10:35 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id 124D3560140;
	Tue, 10 May 2022 20:09:23 +0800 (CST)
Message-ID: <AJwAbwDZIVuayp7pP6u5v4pq.3.1652184563067.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+W2Ys27fco_W6x+UvkUMKva5FpzZEAu4EnhvqM+Bx5NGQ@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Tue, 10 May 2022 20:09:23 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Tue, 10 May 2022 20:09:23 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUJNSx9WT0JLT09LGEpNTU
	0ZVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPT0hJTkNMSUJLTTdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjEMOhkMPyEyLQ4aAgtMCytNDk4NTwsKVUhVSk1OSUpDT05NSElPQ1UzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFNS0xON1dZFAsPEhQVCFlB
	SzcG
X-HM-Tid: 0a80adbbb9998c39kuqt1809496154a
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev] =?utf-8?q?drbd=3A_a_proposal_of_two-primaries_mode?=
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
Content-Type: multipart/mixed; boundary="===============9079009696109867421=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============9079009696109867421==
Content-Type: multipart/alternative; BOUNDARY="=_Part_354754_1911508545.1652184563067"

--=_Part_354754_1911508545.1652184563067
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgpJbiBteSB1c2UtY2FzZSwgdHdvLXByaW1hcmllcyBkcmJkIGRldmljZXMgYXJl
IHVzZWQgYXMgdGhlIGJhY2stZW5kIGRpc2tzIG9mIGlTQ1NJIHJlc3BlY3RpdmVseSwKdGhlbiB0
aGUgdHdvIGlTQ1NJIGRpc2tzIGZvcm0gYSBtdWx0aS1wYXRoIGRpc2suCgoKRm9yIGV4YW1wbGUs
IHRoZXJlIGFyZSB0d28gbm9kZXMobm9kZS0xIGFuZCBub2RlLTIpLCBhbGwgb2YgdGhlbSBhcmUg
cHJpbWFyeSBub2Rlcywgc3VwcG9zZSB0aGVyZSBpcyBhICBkcmJkCgpkZXZpY2UgY2FsbGVkIGRy
YmQxLiBUaGVuIGRyYmQxIG9uIG5vZGUtMSBpcyB1c2VkIGFzIGEgYmFjay1lbmQgZGlzayBvZiBp
U0NTSSB0YXJnZXQsIHRoZSBwZWVyIGRldmljZSBvbiBub2RlLTIKCmlzIHVzZWQgYXMgYSBiYWNr
LWVuZCBkaXNrIG9mIGlTQ1NJIHRhcmdldCB0b28uIEF0IGxhc3QsIHdlIG1ha2UgdGhlc2UgdHdv
IGlTQ1NJIGRpc2tzIGludG8gYSBtdWx0aS1wYXRoIGRpc2suCgoKClNpbmNlIG11bHRpLXBhdGgg
bWF5IHN1Ym1pdCB3cml0ZXMgdG8gdHdvIHByaW1hcmllcyBub2RlcyBjb25jdXJyZW50bHksIGNv
bmZsaWN0aW5nIHdyaXRlcyB3aWxsIGhhcHBlbiBhbmQgY2F1c2UKdGhlIGRyYmQgYmVjb21lIHVu
YXZhaWxhYmxlLgoKQmVzdCByZWdhcmRzLApYdQoKCgoKCgoKCkZyb206IEpvZWwgQ29sbGVkZ2Ug
PGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KRGF0ZTogMjAyMi0wNS0xMCAxOToyNDoyOQpUbzog
ICJydWkueHUiIDxydWkueHVAZWFzeXN0YWNrLmNuPgpDYzogIFBoaWxpcHAgUmVpc25lciA8cGhp
bGlwcC5yZWlzbmVyQGxpbmJpdC5jb20+LGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20sZG9uZ3No
ZW5nLnlhbmdAZWFzeXN0YWNrLmNuClN1YmplY3Q6IFJlOiBkcmJkOiBhIHByb3Bvc2FsIG9mIHR3
by1wcmltYXJpZXMgbW9kZT5IaSBYdSwKPgo+Q291bGQgeW91IGRlc2NyaWJlIHlvdXIgdXNlIGNh
c2UgaW4gbW9yZSBkZXRhaWw/IFdoYXQgYXJlIHlvdSB0cnlpbmcKPnRvIGFjaGlldmUgd2l0aCBE
UkJEPwo+Cj5UaGlzIHdpbGwgaGVscCB1bmRlcnN0YW5kIHdoeSB5b3Ugd291bGQgbGlrZSB0byBy
ZXN0b3JlIHRoZQo+ZnVuY3Rpb25hbGl0eS4gUGVyaGFwcyB0aGVyZSBpcyBhIHNpbXBsZXIgc29s
dXRpb24gdGhhdCBhbHNvIHdvcmtzIGZvcgo+eW91ciBwdXJwb3Nlcy4KPgo+QmVzdCByZWdhcmRz
LAo+Sm9lbAoKCg0KDQo=
--=_Part_354754_1911508545.1652184563067
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+SW4gbXkgdXNlLWNhc2UsIHR3by1wcmltYXJpZXMgZHJiZCBkZXZpY2VzIGFyZSB1c2VkIGFz
IHRoZSBiYWNrLWVuZCBkaXNrcyBvZiBpU0NTSSByZXNwZWN0aXZlbHksPC9kaXY+PGRpdj50aGVu
IHRoZSB0d28gaVNDU0kgZGlza3MgZm9ybSBhIG11bHRpLXBhdGggZGlzay48L2Rpdj48ZGl2Pjxi
ciAvPjwvZGl2PjxkaXY+Rm9yIGV4YW1wbGUsIHRoZXJlIGFyZSB0d28gbm9kZXMobm9kZS0xIGFu
ZCBub2RlLTIpLCBhbGwgb2YgdGhlbSBhcmUgcHJpbWFyeSBub2Rlcywgc3VwcG9zZSB0aGVyZSBp
cyBhJm5ic3A7IGRyYmQgPGJyIC8+PC9kaXY+PGRpdj5kZXZpY2UgY2FsbGVkIGRyYmQxLiBUaGVu
IGRyYmQxIG9uIG5vZGUtMSBpcyB1c2VkIGFzIGEgYmFjay1lbmQgZGlzayBvZiBpU0NTSSB0YXJn
ZXQsIHRoZSBwZWVyIGRldmljZSBvbiBub2RlLTIgPGJyIC8+PC9kaXY+PGRpdj5pcyB1c2VkIGFz
IGEgYmFjay1lbmQgZGlzayBvZiBpU0NTSSB0YXJnZXQgdG9vLiBBdCBsYXN0LCB3ZSBtYWtlIHRo
ZXNlIHR3byBpU0NTSSBkaXNrcyBpbnRvIGEgbXVsdGktcGF0aCBkaXNrLjxiciAvPjwvZGl2Pjxk
aXY+PGJyIC8+PC9kaXY+PGRpdj5TaW5jZSBtdWx0aS1wYXRoIG1heSBzdWJtaXQgd3JpdGVzIHRv
IHR3byBwcmltYXJpZXMgbm9kZXMgY29uY3VycmVudGx5LCBjb25mbGljdGluZyB3cml0ZXMgd2ls
bCBoYXBwZW4gYW5kIGNhdXNlPC9kaXY+PGRpdj50aGUgZHJiZCBiZWNvbWUgdW5hdmFpbGFibGUu
PGJyIC8+PC9kaXY+PGRpdj48cHJlPkJlc3QgcmVnYXJkcywKWHU8L3ByZT48L2Rpdj48ZGl2Pjxi
ciAvPjwvZGl2PjxiciAvPjxiciAvPjxiciAvPjxkaXYgIHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2
ZTt6b29tOjEiPjwvZGl2PjxiciAvPjxwcmU+PGJyIC8+RnJvbTogSm9lbCBDb2xsZWRnZSAmbHQ7
am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tJmd0OwpEYXRlOiAyMDIyLTA1LTEwIDE5OjI0OjI5ClRv
OiAgInJ1aS54dSIgJmx0O3J1aS54dUBlYXN5c3RhY2suY24mZ3Q7CkNjOiAgUGhpbGlwcCBSZWlz
bmVyICZsdDtwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbSZndDssZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbSxkb25nc2hlbmcueWFuZ0BlYXN5c3RhY2suY24KU3ViamVjdDogUmU6IGRyYmQ6IGEg
cHJvcG9zYWwgb2YgdHdvLXByaW1hcmllcyBtb2RlJmd0O0hpIFh1LAomZ3Q7CiZndDtDb3VsZCB5
b3UgZGVzY3JpYmUgeW91ciB1c2UgY2FzZSBpbiBtb3JlIGRldGFpbD8gV2hhdCBhcmUgeW91IHRy
eWluZwomZ3Q7dG8gYWNoaWV2ZSB3aXRoIERSQkQ/CiZndDsKJmd0O1RoaXMgd2lsbCBoZWxwIHVu
ZGVyc3RhbmQgd2h5IHlvdSB3b3VsZCBsaWtlIHRvIHJlc3RvcmUgdGhlCiZndDtmdW5jdGlvbmFs
aXR5LiBQZXJoYXBzIHRoZXJlIGlzIGEgc2ltcGxlciBzb2x1dGlvbiB0aGF0IGFsc28gd29ya3Mg
Zm9yCiZndDt5b3VyIHB1cnBvc2VzLgomZ3Q7CiZndDtCZXN0IHJlZ2FyZHMsCiZndDtKb2VsCjwv
cHJlPjwvZGl2Pjxicj4=
--=_Part_354754_1911508545.1652184563067--

--===============9079009696109867421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============9079009696109867421==--
