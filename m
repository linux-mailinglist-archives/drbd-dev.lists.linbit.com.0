Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 25FB750F376
	for <lists+drbd-dev@lfdr.de>; Tue, 26 Apr 2022 10:11:30 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 11B6E4205A5;
	Tue, 26 Apr 2022 10:11:30 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 462464201DC
	for <drbd-dev@lists.linbit.com>; Tue, 26 Apr 2022 10:11:09 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id 54C1D560153;
	Tue, 26 Apr 2022 16:11:08 +0800 (CST)
Message-ID: <AG2ANwDtIcZhZbyAVwF5-qpm.3.1650960668339.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+Wfbohf2NkB+LXhHSBEQk_jK-Xi+-wRJimG3G0Z2pbbqg@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Tue, 26 Apr 2022 16:11:08 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Tue, 26 Apr 2022 16:11:08 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRkdHx5WSEhISUsdTx1MGE
	9LVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkxVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPSElMQk1OQklIQjdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjxJOjUMPw8yGCETIRkCOi0MPU5WCgsWVUhVSk1OS0JNS01NQ05OQlUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFNTUlCN1dZFAsPEhQVCFlB
	SzcG
X-HM-Tid: 0a8064e90ac38c39kuqt18027e06926
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_fix_a_race_of_drbd=5Ffre?=
	=?utf-8?q?e=5Fpeer=5Freq?=
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
Content-Type: multipart/mixed; boundary="===============0202030914457669643=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============0202030914457669643==
Content-Type: multipart/alternative; BOUNDARY="=_Part_753214_1850874836.1650960668339"

--=_Part_753214_1850874836.1650960668339
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgpJdCBsb29rcyBnb29kIHRvIG1lIGFuZCBpIGhhdmUgc2VudCBhIG5ldyBwYXRj
aCBmb3IgaXQuCgoKClRoYW5rcywKWHUKCgoKCgoKCkZyb206IEpvZWwgQ29sbGVkZ2UgPGpvZWwu
Y29sbGVkZ2VAbGluYml0LmNvbT4KRGF0ZTogMjAyMi0wNC0yMCAxODoyMjozMgpUbzogIFJ1aSBY
dSA8cnVpLnh1QGVhc3lzdGFjay5jbj4KQ2M6ICBQaGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVp
c25lckBsaW5iaXQuY29tPixkcmJkLWRldkBsaXN0cy5saW5iaXQuY29tLGRvbmdzaGVuZy55YW5n
QGVhc3lzdGFjay5jbgpTdWJqZWN0OiBSZTogW1BBVENIXSBkcmJkOiBmaXggYSByYWNlIG9mIGRy
YmRfZnJlZV9wZWVyX3JlcT5IaSBYdSwKPgo+SSB0aGluayB0aGVyZSBpcyBhIHBvdGVudGlhbCBy
YWNlIGhlcmUsIGJ1dCBJIGFtIG5vdCBjb252aW5jZWQgdGhhdAo+dGhpcyBpcyBhIGdlbmVyYWwg
c29sdXRpb24uIFRoZSBwZWVyIHJlcXVlc3QgY291bGQgc3RpbGwgYmUgZnJlZWQgYnkKPmdvdF9w
ZWVyX2FjaygpIGJldHdlZW4gY2hlY2tpbmcgImxpc3RfZW1wdHkoJnBlZXJfcmVxLT5yZWN2X29y
ZGVyKSIKPmFuZCBmcmVlaW5nIGl0IGluIGRyYmRfZmluaXNoX3BlZXJfcmVxcygpLiBBbHNvLCB0
aGlzIHNvbHV0aW9uIGtlZXBzCj50aGUgcGFnZSBjaGFpbiBmb3IgcGVlciByZXF1ZXN0cyBmb3Ig
YW4gdW5uZWNlc3NhcmlseSBsb25nIHRpbWUsIHdoaWNoCj5pcyBub3QgaWRlYWwgaW4gbWVtb3J5
IGNvbnN0cmFpbmVkIHNpdHVhdGlvbnMuCj4KPlRoZSB1bmRlcmx5aW5nIHJhY2UsIGFzIGZhciBh
cyBJIHVuZGVyc3RhbmQgaXQsIGlzIHRoYXQgZ290X3BlZXJfYWNrKCkKPmNhbiBiZSBjYWxsZWQg
d2hpbGUgc3RpbGwgcHJvY2Vzc2luZyB0aGUgcmVxdWVzdCBpbgo+ZHJiZF9maW5pc2hfcGVlcl9y
ZXFzKCkuIFRoaXMgaXMgb25seSByZWxldmFudCBmb3IgcGVlciB3cml0ZXMgYW5kIG5vdAo+cmVz
eW5jLCBzbyBvbmx5IHRoZSBlX2VuZF9ibG9jaygpIHBhdGggaXMgb2YgaW50ZXJlc3QuIGdvdF9w
ZWVyX2FjaygpCj53aWxsIG9ubHkgYmUgY2FsbGVkIGFmdGVyIHdlIGhhdmUgc2VudCB0aGUgY29y
cmVzcG9uZGluZyBiYXJyaWVyIGFjawo+Zm9yIHRoZSBwZWVyIHJlcXVlc3QuCj4KPk9uIHRoZSBi
YXNpcyBvZiB0aGlzIHJlYXNvbmluZywgSSB0aGluayBhIHNpbXBsZSBzb2x1dGlvbiBpcyB0byBz
d2FwCj5kcmJkX21heV9maW5pc2hfZXBvY2goKSBhbmQgZHJiZF9mcmVlX3BhZ2VfY2hhaW4oKSBp
biBlX2VuZF9ibG9jaygpLgo+UGxlYXNlIHRyeSB0aGlzIGFuZCBzZW5kIGl0IGFzIGEgcGF0Y2gg
aWYgaXQgc29sdmVzIHlvdXIgcHJvYmxlbS4KPgo+QnkgdGhlIHdheSwgdGhpcyBwYXRjaCBkb2Vz
bid0IGNvbXBpbGUgZHVlIHRvIGEgbWlzbWF0Y2hlZCBicmFjZS4KPgo+QmVzdCByZWdhcmRzLAo+
Sm9lbAoKCg0KDQo=
--=_Part_753214_1850874836.1650960668339
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+SXQgbG9va3MgZ29vZCB0byBtZSBhbmQgaSBoYXZlIHNlbnQgYSBuZXcgcGF0Y2ggZm9yIGl0
LjxiciAvPjwvZGl2PjxkaXY+PGJyIC8+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5YdTxi
ciAvPjwvZGl2PjxiciAvPjxiciAvPjxiciAvPjxkaXYgIHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2
ZTt6b29tOjEiPjwvZGl2PjxiciAvPjxwcmU+PGJyIC8+RnJvbTogSm9lbCBDb2xsZWRnZSAmbHQ7
am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tJmd0OwpEYXRlOiAyMDIyLTA0LTIwIDE4OjIyOjMyClRv
OiAgUnVpIFh1ICZsdDtydWkueHVAZWFzeXN0YWNrLmNuJmd0OwpDYzogIFBoaWxpcHAgUmVpc25l
ciAmbHQ7cGhpbGlwcC5yZWlzbmVyQGxpbmJpdC5jb20mZ3Q7LGRyYmQtZGV2QGxpc3RzLmxpbmJp
dC5jb20sZG9uZ3NoZW5nLnlhbmdAZWFzeXN0YWNrLmNuClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRy
YmQ6IGZpeCBhIHJhY2Ugb2YgZHJiZF9mcmVlX3BlZXJfcmVxJmd0O0hpIFh1LAomZ3Q7CiZndDtJ
IHRoaW5rIHRoZXJlIGlzIGEgcG90ZW50aWFsIHJhY2UgaGVyZSwgYnV0IEkgYW0gbm90IGNvbnZp
bmNlZCB0aGF0CiZndDt0aGlzIGlzIGEgZ2VuZXJhbCBzb2x1dGlvbi4gVGhlIHBlZXIgcmVxdWVz
dCBjb3VsZCBzdGlsbCBiZSBmcmVlZCBieQomZ3Q7Z290X3BlZXJfYWNrKCkgYmV0d2VlbiBjaGVj
a2luZyAibGlzdF9lbXB0eSgmYW1wO3BlZXJfcmVxLSZndDtyZWN2X29yZGVyKSIKJmd0O2FuZCBm
cmVlaW5nIGl0IGluIGRyYmRfZmluaXNoX3BlZXJfcmVxcygpLiBBbHNvLCB0aGlzIHNvbHV0aW9u
IGtlZXBzCiZndDt0aGUgcGFnZSBjaGFpbiBmb3IgcGVlciByZXF1ZXN0cyBmb3IgYW4gdW5uZWNl
c3NhcmlseSBsb25nIHRpbWUsIHdoaWNoCiZndDtpcyBub3QgaWRlYWwgaW4gbWVtb3J5IGNvbnN0
cmFpbmVkIHNpdHVhdGlvbnMuCiZndDsKJmd0O1RoZSB1bmRlcmx5aW5nIHJhY2UsIGFzIGZhciBh
cyBJIHVuZGVyc3RhbmQgaXQsIGlzIHRoYXQgZ290X3BlZXJfYWNrKCkKJmd0O2NhbiBiZSBjYWxs
ZWQgd2hpbGUgc3RpbGwgcHJvY2Vzc2luZyB0aGUgcmVxdWVzdCBpbgomZ3Q7ZHJiZF9maW5pc2hf
cGVlcl9yZXFzKCkuIFRoaXMgaXMgb25seSByZWxldmFudCBmb3IgcGVlciB3cml0ZXMgYW5kIG5v
dAomZ3Q7cmVzeW5jLCBzbyBvbmx5IHRoZSBlX2VuZF9ibG9jaygpIHBhdGggaXMgb2YgaW50ZXJl
c3QuIGdvdF9wZWVyX2FjaygpCiZndDt3aWxsIG9ubHkgYmUgY2FsbGVkIGFmdGVyIHdlIGhhdmUg
c2VudCB0aGUgY29ycmVzcG9uZGluZyBiYXJyaWVyIGFjawomZ3Q7Zm9yIHRoZSBwZWVyIHJlcXVl
c3QuCiZndDsKJmd0O09uIHRoZSBiYXNpcyBvZiB0aGlzIHJlYXNvbmluZywgSSB0aGluayBhIHNp
bXBsZSBzb2x1dGlvbiBpcyB0byBzd2FwCiZndDtkcmJkX21heV9maW5pc2hfZXBvY2goKSBhbmQg
ZHJiZF9mcmVlX3BhZ2VfY2hhaW4oKSBpbiBlX2VuZF9ibG9jaygpLgomZ3Q7UGxlYXNlIHRyeSB0
aGlzIGFuZCBzZW5kIGl0IGFzIGEgcGF0Y2ggaWYgaXQgc29sdmVzIHlvdXIgcHJvYmxlbS4KJmd0
OwomZ3Q7QnkgdGhlIHdheSwgdGhpcyBwYXRjaCBkb2Vzbid0IGNvbXBpbGUgZHVlIHRvIGEgbWlz
bWF0Y2hlZCBicmFjZS4KJmd0OwomZ3Q7QmVzdCByZWdhcmRzLAomZ3Q7Sm9lbAo8L3ByZT48L2Rp
dj48YnI+
--=_Part_753214_1850874836.1650960668339--

--===============0202030914457669643==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============0202030914457669643==--
