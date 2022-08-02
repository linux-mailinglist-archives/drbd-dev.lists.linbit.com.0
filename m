Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F32587599
	for <lists+drbd-dev@lfdr.de>; Tue,  2 Aug 2022 04:43:11 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 961134206B5;
	Tue,  2 Aug 2022 04:43:10 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 444 seconds by postgrey-1.31 at mail19;
	Tue, 02 Aug 2022 04:43:08 CEST
Received: from mail-m313.qiye.163.com (mail-m313.qiye.163.com [103.74.31.3])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id AFFED4205DD
	for <drbd-dev@lists.linbit.com>; Tue,  2 Aug 2022 04:43:07 +0200 (CEST)
Received: from easystack.cn (unknown [127.0.0.1])
	by mail-m313.qiye.163.com (Hmail) with ESMTP id AC70E4C017F;
	Tue,  2 Aug 2022 10:35:40 +0800 (CST)
Message-ID: <ABYAVwB1IqyXlncsZ*hUBKoo.3.1659407740699.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+UM0GR2oukOeN8NoKMka=_Hox4SB9MSBgNPMcOrcYxqXg@mail.gmail.com>
References: <CAGNP_+UM0GR2oukOeN8NoKMka=_Hox4SB9MSBgNPMcOrcYxqXg@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Tue, 2 Aug 2022 10:35:40 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Tue, 2 Aug 2022 10:35:40 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZHkMeVklOGkofT0kaGR9PSFUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpKS0hKQ1VLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPQ05NSUxKQ0pCSDdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjkiOi0MOUoyCgIjFxUYCCFREy45MBQUVUhVSk1OQk9LTExPS0JITVUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFOSUNNN1dZFAsPEhQVCFlB
	SzcG
X-HM-Tid: 0a825c57b90200d3kurm1823911724e
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_fix_a_bug_with_two-prima?=
	=?utf-8?q?ries_configuration?=
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
Content-Type: multipart/mixed; boundary="===============8616037111162089574=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============8616037111162089574==
Content-Type: multipart/alternative; BOUNDARY="=_Part_88758_1326603036.1659407740699"

--=_Part_88758_1326603036.1659407740699
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKICBUaGFua3MgZm9yIHRoZSByZXBseS4gSXQgaXMgaW5kZWVkIGEgaW50ZW5kZWQg
YmVoYXZpb3IgYW5kIGkgd2lsbCBkaXNjYXJkIHRoZSBwYXRjaC4KClRoYW5rcywKWHUKCgoKCgoK
CkZyb206IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KRGF0ZTogMjAy
Mi0wOC0wMSAyMjoyMjoxMgpUbzogIFJ1aSBYdSA8cnVpLnh1QGVhc3lzdGFjay5jbj4KQ2M6ICBQ
aGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPixkcmJkLWRldkBsaXN0
cy5saW5iaXQuY29tLGRvbmdzaGVuZy55YW5nQGVhc3lzdGFjay5jbgpTdWJqZWN0OiBSZTogW1BB
VENIXSBkcmJkOiBmaXggYSBidWcgd2l0aCB0d28tcHJpbWFyaWVzIGNvbmZpZ3VyYXRpb24+VGhl
IGJlaGF2aW9yIHRoYXQgeW91IGRlc2NyaWJlIGlzIHRoZSBpbnRlbmRlZCBiZWhhdmlvciwgSSBi
ZWxpZXZlLiBJZgo+eW91IGhhdmUgdHdvIHByaW1hcmllcyBhbmQgd2FudCB0byBkaXNjb25uZWN0
IHRoZW0gaW4gYSBjb250cm9sbGVkCj5mYXNoaW9uLCB5b3Ugc2hvdWxkIGRlbW90ZSB0aGVtIGZp
cnN0Lgo+Cj5BcyBkaXNjdXNzZWQgcHJldmlvdXNseSwgeW91IHByb2JhYmx5IHNob3VsZCBub3Qg
YmUgdXNpbmcKPiJhbGxvdy10d28tcHJpbWFyaWVzIiBhdCBhbGwuCj4KPlRoZSBwcm9wb3NlZCBw
YXRjaCB1bmZvcnR1bmF0ZWx5IGFsc28gYnJlYWtzIHZhcmlvdXMgb3RoZXIgdXNhZ2UKPnNjZW5h
cmlvcy4gRm9yIGluc3RhbmNlLCBpZiB5b3UgaGF2ZSB0d28gbm9kZXMgdGhhdCBhcmUgYm90aCBT
ZWNvbmRhcnkKPmFuZCBVcFRvRGF0ZSwgYW5kIHJ1biAnZHJiZHNldHVwIGRpc2Nvbm5lY3QnLCBp
dCB3aWxsIGNhdXNlIHRoZW0gdG8KPmJlY29tZSBPdXRkYXRlZC4KPgo+QmVzdCByZWdhcmRzLAo+
Sm9lbAoKCg0KDQo=
--=_Part_88758_1326603036.1659407740699
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PiZuYnNwOyBUaGFua3Mg
Zm9yIHRoZSByZXBseS4gSXQgaXMgaW5kZWVkIGEgaW50ZW5kZWQgYmVoYXZpb3IgYW5kIGkgd2ls
bCBkaXNjYXJkIHRoZSBwYXRjaC48YnI+PC9kaXY+PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5YdTxi
cj48L2Rpdj48YnI+PGJyPjxicj48ZGl2ICBzdHlsZT0icG9zaXRpb246cmVsYXRpdmU7em9vbTox
Ij48L2Rpdj48YnI+PHByZT48YnI+RnJvbTogSm9lbCBDb2xsZWRnZSAmbHQ7am9lbC5jb2xsZWRn
ZUBsaW5iaXQuY29tJmd0OwpEYXRlOiAyMDIyLTA4LTAxIDIyOjIyOjEyClRvOiAgUnVpIFh1ICZs
dDtydWkueHVAZWFzeXN0YWNrLmNuJmd0OwpDYzogIFBoaWxpcHAgUmVpc25lciAmbHQ7cGhpbGlw
cC5yZWlzbmVyQGxpbmJpdC5jb20mZ3Q7LGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20sZG9uZ3No
ZW5nLnlhbmdAZWFzeXN0YWNrLmNuClN1YmplY3Q6IFJlOiBbUEFUQ0hdIGRyYmQ6IGZpeCBhIGJ1
ZyB3aXRoIHR3by1wcmltYXJpZXMgY29uZmlndXJhdGlvbiZndDtUaGUgYmVoYXZpb3IgdGhhdCB5
b3UgZGVzY3JpYmUgaXMgdGhlIGludGVuZGVkIGJlaGF2aW9yLCBJIGJlbGlldmUuIElmCiZndDt5
b3UgaGF2ZSB0d28gcHJpbWFyaWVzIGFuZCB3YW50IHRvIGRpc2Nvbm5lY3QgdGhlbSBpbiBhIGNv
bnRyb2xsZWQKJmd0O2Zhc2hpb24sIHlvdSBzaG91bGQgZGVtb3RlIHRoZW0gZmlyc3QuCiZndDsK
Jmd0O0FzIGRpc2N1c3NlZCBwcmV2aW91c2x5LCB5b3UgcHJvYmFibHkgc2hvdWxkIG5vdCBiZSB1
c2luZwomZ3Q7ImFsbG93LXR3by1wcmltYXJpZXMiIGF0IGFsbC4KJmd0OwomZ3Q7VGhlIHByb3Bv
c2VkIHBhdGNoIHVuZm9ydHVuYXRlbHkgYWxzbyBicmVha3MgdmFyaW91cyBvdGhlciB1c2FnZQom
Z3Q7c2NlbmFyaW9zLiBGb3IgaW5zdGFuY2UsIGlmIHlvdSBoYXZlIHR3byBub2RlcyB0aGF0IGFy
ZSBib3RoIFNlY29uZGFyeQomZ3Q7YW5kIFVwVG9EYXRlLCBhbmQgcnVuICdkcmJkc2V0dXAgZGlz
Y29ubmVjdCcsIGl0IHdpbGwgY2F1c2UgdGhlbSB0bwomZ3Q7YmVjb21lIE91dGRhdGVkLgomZ3Q7
CiZndDtCZXN0IHJlZ2FyZHMsCiZndDtKb2VsCjwvcHJlPjwvZGl2Pjxicj4=
--=_Part_88758_1326603036.1659407740699--

--===============8616037111162089574==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============8616037111162089574==--
