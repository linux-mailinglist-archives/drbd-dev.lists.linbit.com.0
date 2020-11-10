Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [78.108.216.32])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF792ADC61
	for <lists+drbd-dev@lfdr.de>; Tue, 10 Nov 2020 17:48:11 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 56FA14207A1;
	Tue, 10 Nov 2020 17:48:10 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 409 seconds by postgrey-1.31 at mail19;
	Tue, 10 Nov 2020 17:48:08 CET
Received: from zimbra.alteeve.com (mail.alteeve.ca [65.39.153.71])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFA4742062B
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 17:48:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id E337813FD
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 11:41:13 -0500 (EST)
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10032)
	with ESMTP id 8ze04s4yqP2S for <drbd-dev@lists.linbit.com>;
	Tue, 10 Nov 2020 11:41:13 -0500 (EST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.alteeve.com (Postfix) with ESMTP id 4ACD4CC4
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 11:41:13 -0500 (EST)
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra.alteeve.com 4ACD4CC4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alteeve.ca;
	s=3658BF78-91B3-11E8-A999-AEFD2914AE28; t=1605026473;
	bh=kARE6ydEYVEq6mjeUcCLjKBoCgK8W9rORrjVJuNkKoc=;
	h=To:From:Message-ID:Date:MIME-Version;
	b=o2Ku1YA42IbDY2CD7ZHzPrjv6PhCPdOv3CnzUfpwjen8coIfpzY9bSa9qryQuLv+7
	IG7yA/Bkxxny184s5oTeIoI1Ums9wle89PCjgS1QTJjpFRG4/GmG9FKWyc6lzm4X+4
	QaRFfj6JOerWiwIVVqRCHBpq589Xlu7jNDj9FaJpq1VfnWy93EA7LppELEKfYUj8fu
	1MKFrEXPw64byYc3g0NsyLkfQRMSjybIYasT/FIJdQZtaOYqODdq//Of/dxUV8RP5S
	5wfXoN7qok93WAscbVQcozQaxmgWOm8EfHgUDDs/Kf1MOlINfhjdipfF3Tz3LqdKqI
	UGa0r7G4oMRsg==
X-Virus-Scanned: amavisd-new at zimbra.alteeve.com
Received: from zimbra.alteeve.com ([127.0.0.1])
	by localhost (zimbra.alteeve.com [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id ax1HUV5iAPcf for <drbd-dev@lists.linbit.com>;
	Tue, 10 Nov 2020 11:41:13 -0500 (EST)
Received: from pulsar.alteeve.com (dhcp-108-168-17-168.cable.user.start.ca
	[108.168.17.168])
	by zimbra.alteeve.com (Postfix) with ESMTPSA id 1BB52589
	for <drbd-dev@lists.linbit.com>; Tue, 10 Nov 2020 11:41:13 -0500 (EST)
To: drbd-dev@lists.linbit.com
From: Digimer <lists@alteeve.ca>
Message-ID: <3e0af4f3-00fd-0aa3-93c6-eea48baccac6@alteeve.ca>
Date: Tue, 10 Nov 2020 11:41:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
	Thunderbird/78.4.0
MIME-Version: 1.0
Content-Language: en-US
Subject: [Drbd-dev] Possible obscure bug
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

SGkgYWxsLAoKICBEUkJEIHY4LjQuMTEuCgogIFdlIGhhZCBhIGNhc2Ugd2hlcmUgYSBjbGllbnQg
d2FzIHVwZ3JhZGluZyBmcm9tIDFHYnBzIHRvIDEwR2JwcyBOSUNzCmZvciBiYWNraW5nIERSQkQu
IFRoZSBpbnRlcmZhY2Ugd2FzIGFuIG1vZGU9MSAoYWN0aXZlL3Bhc3NpdmUpIGJvbmQsIHR3bwpp
bnRlcmZhY2VzLiBXZSBuZWVkZWQgdG8gc3dpdGNoIG9uZSBvZiB0aGUgYm9uZGVkIGludGVyZmFj
ZXMgdG8gYSBuZXcKcGh5c2ljYWwgTklDIHBvcnQuIFRoaXMgaXMgYSBwcm9jZXNzIEkndmUgZG9u
ZSBjb3VudGxlc3MgdGltZXMgYmVmb3JlLApidXQgdGhpcyB3YXMgdGhlIGZpcnN0IHRpbWUgSSBk
aWQgaXQgd2hpbGUgRFJCRCB3YXMgdXAgb24gb25lIG5vZGUuCgogIFdlIGRpc2Nvbm5lY3RlZCB0
aGUgcGVlciB0aGF0IHdhc24ndCBuZWVkZWQsIHNvIERSQkQgd2FzIHJ1bm5pbmcgYWxvbmUKb24g
dGhlIGFjdGl2ZSBub2RlLiBXZSAnaWZkb3duIHNuX2xpbmsxJyAodGhlIG5hbWUgb2YgdGhlIGlu
dGVyZmFjZSB3ZQp3ZXJlIGFib3V0IHRvIGNoYW5nZSwgd2hpY2ggaGFkIGJlZW4gdGhlIGFjdGl2
ZSBsaW5rKS4gQ29uZmlybWVkIHdpdGgKL3Byb2MvbmV0L2JvbmQvc25fYm9uZDEgKGJvbmQgbmFt
ZSkgdGhhdCB0aGUgc25fbGluazEgKGludGVyZmFjZSkgd2FzCm91dCBvZiB0aGUgYm9uZCBhbmQg
dGhlIGJvbmQgd2FzIHVzaW5nICdzbl9saW5rMicgKGludGVyZmFjZSB0aGF0IHdhcwpub3QgdG8g
YmUgY2hhbmdlZCkuIFdlIGFsc28gY29uZmlybWVkIHRoYXQgdGhlIGV0aFggZGV2aWNlIHRoYXQg
d2FzCmdvaW5nIHRvIGJlIG1vdmVkIG92ZXIgd2FzIGFsc28gZG93bi4KCiAgV2UgdXBkYXRlZCAv
ZXRjL3VkZXYvcnVsZXMuZC83MC1wZXJzaXN0ZW50LW5ldC5ydWxlcyB0byBzd2FwIHRoZSBNQUMs
CnRoZW4gZGlkICdzdGFydF91ZGV2JyB0byByZW5hbWUgdGhlIGludGVyZmFjZS4gTm9ybWFsbHkg
dGhpcyByZXR1cm5zIGluCmEgY291cGxlIHNlY29uZHMsIGJ1dCBpbiB0aGlzIGluc3RhbmNlLCBp
dCB0b29rIGEgY291cGxlIG9mIG1pbnV0ZXMgdG8KcmV0dXJuLiBXaGVuIGl0IGRpZCwgc25fbGlu
azEgZGlkbid0IGV4aXN0IGFueW1vcmUgYW5kIHRoZSBib25kIHByb2MKZmlsZSBhbHNvIHNob3dl
ZCB0aGF0IHRoZSBpbnRlcmZhY2UgaGFkbid0IGNvbWUgdXAuCgogIE9LLCBzbyBhbGwgdGhpcyBz
byBmYXIgd2Fzbid0IGEgYmlnIGRlYWwuIFRoZSByZWFsIGNvbmNlcm4gd2FzIHRoYXQKYWxsIG9m
IHRoZSBWTXMgdGhhdCB3ZXJlIG9uIExWcyBiYWNrZWQgYnkgRFJCRCBhY3RlZCBsaWtlIHRoZXkg
bG9zdAp0aGVpciBoYXJkIGRyaXZlcy4gSSB3YXMgdGFpbCdpbmcgc3lzbG9nIGFuZCB0aGVyZSB3
ZXJlIG5vIGVudHJpZXMgZnJvbQpEUkJEIGF0IGFsbC4KCiAgSSBoYWQgdG8gc3RvcCBEUkJEIGFu
ZCByZWJvb3QgdGhlIG5vZGUgdG8gcmVjb3Zlci4gT24gcmVib290LCB0aGUKaW50ZXJmYWNlIChz
bl9saW5rMSkgY2FtZSB1cCBwcm9wZXJseSBvbiB0aGUgbmV3IE5JQyBhbmQgRFJCRCBzdGFydGVk
Cm5vcm1hbGx5LgoKICBJIGZ1bGx5IHVuZGVyc3RhbmQgIndlbGwgZG9uJ3QgZG8gdGhhdCIgYXMg
YSAiZml4IiwgYW5kIEkgY2VydGFpbmx5CndpbGwgbm90IHRyeSB0aGlzIGFnYWluLgoKICBJJ20g
d3JpdGluZyB0aGlzIHRob3VnaCBhcyBJIHRoaW5rIGl0IG1pZ2h0IGJlIGFuIGluZGljYXRpb24g
b2YgYQpkZWVwZXIgaXNzdWUgdGhhdCBtaWdodCBiaXRlIG90aGVycyBpbiB0aGUgZnV0dXJlLiBJ
dCBzZWVtcyBsaWtlIERSQkQKImhlbGQgb3BlbiIgdGhlIGludGVyZmFjZSB1bmRlciB0aGUgYm9u
ZGVkIGludGVyZmFjZSwgZGVzcGl0ZSB0aGUgTklDCmJlaW5nIGRvd24nZWQuIFRoYXQgRFJCRCB0
b3RhbGx5IHN0b3BwZWQgYWxsb3dpbmcgZGlzayBhY2Nlc3Mgd2l0aG91dAphbnkgbG9nIG1lc3Nh
Z2VzIHRvIGluZGljYXRlIGl0IGhpdCBhIHByb2JsZW0gbWFrZXMgbWUgdGhpbmcgdGhpcyBpcyBu
b3QKYSBrbm93biBmYWlsdXJlIGNvbmRpdGlvbi4KCiAgT25lIG1vcmUgaW50ZXJlc3RpbmcgdGlk
Yml0OwoKICBUaGVyZSdzIGEgc2luZ2xlIERSQkQgcmVzb3VyY2Ugb24gdGhpcyBzeXN0ZW0sIGFj
dGluZyBhcyBhIFBWIGZvciBhCmNsdXN0ZXJlZCBWRy4gRWFjaCBWTSBnZXRzIGFuIExWLCBhbmQg
dGhlcmUncyBvbmUgYWRkaXRpb25hbCBMViBmb3IgYQpHRlMyIHBhcnRpdGlvbi4gVGhlIGdmczIg
cGFydGl0aW9uIHdhcyBub3QgaW4gdXNlIHdoZW4gdGhlIHJlbmFtZSBvZiB0aGUKaW50ZXJmYWNl
IHdhcyByZXF1ZXN0ZWQsIGFuZCBvZGRseSBlbm91Z2gsIEkgX2NvdWxkXyB3cml0ZSB0byBpdCBh
ZnRlci4KU28gaXQgc2VlbXMgbGlrZSBvbmx5IHBhcnRzIHRoYXQgd2VyZSBpbiB1c2UgaHVuZywg
d2hpbGUgcGFydHMgdGhhdCB3ZXJlCm5vdC4KCiAgV3JpdGluZyB0aGlzIG91dCwgSSBhbHNvIHdv
bmRlciBpZiB0aGlzIG1pZ2h0IGJlIGFuIExWTSBpc3N1ZSwgYW5kIG5vdAphIGRyYmQgaXNzdWU/
CgogIEFueSBpbnNpZ2h0L2ZlZWRiYWNrIHdvdWxkIGJlIG11Y2ggYXBwcmVjaWF0ZWQuIEl0IHdh
cyBxdWl0ZSB0aGUKcGFudGFsb29uIHNvaWxpbmcgZXZlbnQsIGFuZCBJJ2QgbGlrZSB0byB1bmRl
cnN0YW5kIGp1c3Qgd2hhdCBoYXBwZW5lZC4KCmRpZ2ltZXIKCi0tIApEaWdpbWVyClBhcGVycyBh
bmQgUHJvamVjdHM6IGh0dHBzOi8vYWx0ZWV2ZS5jb20vdy8KIkkgYW0sIHNvbWVob3csIGxlc3Mg
aW50ZXJlc3RlZCBpbiB0aGUgd2VpZ2h0IGFuZCBjb252b2x1dGlvbnMgb2YKRWluc3RlaW7igJlz
IGJyYWluIHRoYW4gaW4gdGhlIG5lYXIgY2VydGFpbnR5IHRoYXQgcGVvcGxlIG9mIGVxdWFsIHRh
bGVudApoYXZlIGxpdmVkIGFuZCBkaWVkIGluIGNvdHRvbiBmaWVsZHMgYW5kIHN3ZWF0c2hvcHMu
IiAtIFN0ZXBoZW4gSmF5IEdvdWxkCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyYmQtZGV2IG1haWxpbmcgbGlzdApkcmJkLWRldkBsaXN0cy5saW5iaXQu
Y29tCmh0dHBzOi8vbGlzdHMubGluYml0LmNvbS9tYWlsbWFuL2xpc3RpbmZvL2RyYmQtZGV2Cg==
