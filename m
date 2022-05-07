Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EC8F51E594
	for <lists+drbd-dev@lfdr.de>; Sat,  7 May 2022 10:27:52 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7C219420471;
	Sat,  7 May 2022 10:27:51 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 4B1554201FE
	for <drbd-dev@lists.linbit.com>; Sat,  7 May 2022 10:27:49 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id 3F934560166;
	Sat,  7 May 2022 16:27:48 +0800 (CST)
Message-ID: <ANcA3QC1IbqI8UC0Hik964qL.3.1651912068250.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+Up_UN9eCVShQ=Rg5yHpkFjEUiNcBpRJTMAgYiy=uwp2A@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Sat, 7 May 2022 16:27:48 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Sat, 7 May 2022 16:27:48 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWUMZT0pWTUgZTExJHksYQ0
	8aVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPSE1CT09OS05ITTdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjUYOkgqOEoyGQoyQy44SzMSEEJNTwo3VUhVSk1OSkJKSUtNQ01OQ1UzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFOQk1CN1dZFAsPEhQVCFlB
	SzcG
X-HM-Tid: 0a809d9fc3778c39kuqt1809494e537
Cc: Philipp Reisner <philipp.reisner@linbit.com>, drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_change_the_variable_ov?=
	=?utf-8?q?=5Fleft_to_atomic?=
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
Content-Type: multipart/mixed; boundary="===============8773276521233427826=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============8773276521233427826==
Content-Type: multipart/alternative; BOUNDARY="=_Part_145293_1124418749.1651912068250"

--=_Part_145293_1124418749.1651912068250
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlvbiBhbmQgaSd2ZSBzZW50IGEgbmV3
IHBhdGNoIGZvciBpdC4KCgpUaGFua3MsClh1CgoKCgoKCgoKRnJvbTogSm9lbCBDb2xsZWRnZSA8
am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tPgpEYXRlOiAyMDIyLTA1LTAzIDE2OjM3OjI4ClRvOiAg
UnVpIFh1IDxydWkueHVAZWFzeXN0YWNrLmNuPgpDYzogIFBoaWxpcHAgUmVpc25lciA8cGhpbGlw
cC5yZWlzbmVyQGxpbmJpdC5jb20+LGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KU3ViamVjdDog
UmU6IFtEcmJkLWRldl0gW1BBVENIXSBkcmJkOiBjaGFuZ2UgdGhlIHZhcmlhYmxlIG92X2xlZnQg
dG8gYXRvbWljPkhpIFh1LAo+Cj5Zb3VyIGFuYWx5c2lzIG9mIHRoZSBwcm9ibGVtIHNlZW1zIGNv
cnJlY3QgdG8gbWUuIFNvbWUgZGV0YWlscyBvZiB0aGUKPmZpeCBjb3VsZCBiZSBpbXByb3ZlZC4K
Pgo+SW4gdmVyaWZ5X3Byb2dyZXNzKCkgdGhlcmUgYXJlIG5vdyAzIHNlcGFyYXRlIGF0b21pYyBv
cGVyYXRpb25zLiBJdAo+d291bGQgYmUgYmV0dGVyIHRvIHVzZSBhdG9taWM2NF9kZWNfcmV0dXJu
KCkgYW5kIHRoZW4gdXNlIHRoZSByZXR1cm5lZAo+dmFsdWUgaW5zdGVhZCBvZiBjYWxsaW5nIGF0
b21pYzY0X3JlYWQoKSBzZXBhcmF0ZWx5LiBUaGlzIGNvdWxkIGhhdmUKPm1pbm9yIGVmZmVjdHMg
b24gdGhlIGJlaGF2aW9yLgo+Cj5TaW1pbGFybHksIGluIHJlY2VpdmVfRGF0YVJlcXVlc3QoKSB0
aGVyZSBpcyBubyBuZWVkIHRvIHJlYWQgb3ZfbGVmdAo+YWdhaW4gYWZ0ZXIgc2V0dGluZyBpdC4g
VGhpcyBzaG91bGQgaGF2ZSBubyBlZmZlY3Qgb24gdGhlIGJlaGF2aW9yLAo+YnV0IGxlYWRzIHRv
IGNsZWFuZXIgY29kZS4KPgo+QWxzbyB0aGUgcmVwZWF0ZWQgcmVhZHMgaW4gZmluaXNoX3N0YXRl
X2NoYW5nZSgpIGNvdWxkIGJlIGF2b2lkZWQgZm9yCj5jbGVhbmVyIGNvZGUuIFRha2UgY2FyZSBv
ZiB0aGUgcmVhZCBhZnRlciBzZXRfb3ZfcG9zaXRpb24oKSwgc2luY2UKPnRoYXQgY2hhbmdlcyB0
aGUgdmFsdWUgb2Ygb3ZfbGVmdC4gWW91IGNvdWxkIHVzZSBwZWVyX2RldmljZS0+cnNfdG90YWwK
Pmluc3RlYWQgb2YgcGVlcl9kZXZpY2UtPm92X2xlZnQgdGhlcmUsIHNpbmNlIHRoYXQgaXMgd2hh
dCBpdCBpcyBzZXQgdG8KPmluIHNldF9vdl9wb3NpdGlvbigpLgo+Cj5CZXN0IHJlZ2FyZHMsCj5K
b2VsCgoKDQoNCg==
--=_Part_145293_1124418749.1651912068250
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+VGhhbmtzIGZvciB5b3VyIHN1Z2dlc3Rpb24gYW5kIGkndmUgc2VudCBhIG5ldyBwYXRjaCBm
b3IgaXQuPC9kaXY+PGRpdj48YnIgLz48L2Rpdj48ZGl2PlRoYW5rcyw8L2Rpdj48ZGl2Plh1PGJy
IC8+PC9kaXY+PGJyIC8+PGJyIC8+PGJyIC8+PGJyIC8+PGRpdiAgc3R5bGU9InBvc2l0aW9uOnJl
bGF0aXZlO3pvb206MSI+PC9kaXY+PGJyIC8+PHByZT48YnIgLz5Gcm9tOiBKb2VsIENvbGxlZGdl
ICZsdDtqb2VsLmNvbGxlZGdlQGxpbmJpdC5jb20mZ3Q7CkRhdGU6IDIwMjItMDUtMDMgMTY6Mzc6
MjgKVG86ICBSdWkgWHUgJmx0O3J1aS54dUBlYXN5c3RhY2suY24mZ3Q7CkNjOiAgUGhpbGlwcCBS
ZWlzbmVyICZsdDtwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbSZndDssZHJiZC1kZXZAbGlzdHMu
bGluYml0LmNvbQpTdWJqZWN0OiBSZTogW0RyYmQtZGV2XSBbUEFUQ0hdIGRyYmQ6IGNoYW5nZSB0
aGUgdmFyaWFibGUgb3ZfbGVmdCB0byBhdG9taWMmZ3Q7SGkgWHUsCiZndDsKJmd0O1lvdXIgYW5h
bHlzaXMgb2YgdGhlIHByb2JsZW0gc2VlbXMgY29ycmVjdCB0byBtZS4gU29tZSBkZXRhaWxzIG9m
IHRoZQomZ3Q7Zml4IGNvdWxkIGJlIGltcHJvdmVkLgomZ3Q7CiZndDtJbiB2ZXJpZnlfcHJvZ3Jl
c3MoKSB0aGVyZSBhcmUgbm93IDMgc2VwYXJhdGUgYXRvbWljIG9wZXJhdGlvbnMuIEl0CiZndDt3
b3VsZCBiZSBiZXR0ZXIgdG8gdXNlIGF0b21pYzY0X2RlY19yZXR1cm4oKSBhbmQgdGhlbiB1c2Ug
dGhlIHJldHVybmVkCiZndDt2YWx1ZSBpbnN0ZWFkIG9mIGNhbGxpbmcgYXRvbWljNjRfcmVhZCgp
IHNlcGFyYXRlbHkuIFRoaXMgY291bGQgaGF2ZQomZ3Q7bWlub3IgZWZmZWN0cyBvbiB0aGUgYmVo
YXZpb3IuCiZndDsKJmd0O1NpbWlsYXJseSwgaW4gcmVjZWl2ZV9EYXRhUmVxdWVzdCgpIHRoZXJl
IGlzIG5vIG5lZWQgdG8gcmVhZCBvdl9sZWZ0CiZndDthZ2FpbiBhZnRlciBzZXR0aW5nIGl0LiBU
aGlzIHNob3VsZCBoYXZlIG5vIGVmZmVjdCBvbiB0aGUgYmVoYXZpb3IsCiZndDtidXQgbGVhZHMg
dG8gY2xlYW5lciBjb2RlLgomZ3Q7CiZndDtBbHNvIHRoZSByZXBlYXRlZCByZWFkcyBpbiBmaW5p
c2hfc3RhdGVfY2hhbmdlKCkgY291bGQgYmUgYXZvaWRlZCBmb3IKJmd0O2NsZWFuZXIgY29kZS4g
VGFrZSBjYXJlIG9mIHRoZSByZWFkIGFmdGVyIHNldF9vdl9wb3NpdGlvbigpLCBzaW5jZQomZ3Q7
dGhhdCBjaGFuZ2VzIHRoZSB2YWx1ZSBvZiBvdl9sZWZ0LiBZb3UgY291bGQgdXNlIHBlZXJfZGV2
aWNlLSZndDtyc190b3RhbAomZ3Q7aW5zdGVhZCBvZiBwZWVyX2RldmljZS0mZ3Q7b3ZfbGVmdCB0
aGVyZSwgc2luY2UgdGhhdCBpcyB3aGF0IGl0IGlzIHNldCB0bwomZ3Q7aW4gc2V0X292X3Bvc2l0
aW9uKCkuCiZndDsKJmd0O0Jlc3QgcmVnYXJkcywKJmd0O0pvZWwKPC9wcmU+PC9kaXY+PGJyPg==
--=_Part_145293_1124418749.1651912068250--

--===============8773276521233427826==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============8773276521233427826==--
