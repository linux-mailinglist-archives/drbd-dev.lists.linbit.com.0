Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F4FF598280
	for <lists+drbd-dev@lfdr.de>; Thu, 18 Aug 2022 13:53:28 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 7437C42088A;
	Thu, 18 Aug 2022 13:53:27 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 355 seconds by postgrey-1.31 at mail19;
	Thu, 18 Aug 2022 13:53:26 CEST
Received: from mail-m24168.qiye.163.com (mail-m24168.qiye.163.com
	[220.194.24.168])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id C6C9B420634
	for <drbd-dev@lists.linbit.com>; Thu, 18 Aug 2022 13:53:26 +0200 (CEST)
Received: from easystack.cn (unknown [127.0.0.1])
	by mail-m24168.qiye.163.com (Hmail) with ESMTP id 8C629700204;
	Thu, 18 Aug 2022 19:47:29 +0800 (CST)
Message-ID: <AH6A0gB1IlCr-VDLTDeoAKqQ.3.1660823249569.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+VqDKWbr=-+vg6wzMZjoSdicjeQtw4-NsHwBgSvhapwkw@mail.gmail.com>
References: <CAGNP_+VqDKWbr=-+vg6wzMZjoSdicjeQtw4-NsHwBgSvhapwkw@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Thu, 18 Aug 2022 19:47:29 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Thu, 18 Aug 2022 19:47:29 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFJQjdXWS1ZQUlXWQ8JGhUIEh9ZQVkZTh5JVk9NQh1CTB4dQ04eHlUZERMWGhIXJBQOD1
	lXWRgSC1lBWUlKQ1VCT1VKSkNVQktZV1kWGg8SFR0UWUFZT0tIVUpKS0hKTFVLWQY+
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPQ0xCSE5CT0JDSjdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjNNOkscOUoyFzgJVi0*Ny8*HhQ6MAoqVUhVSk1NS0NJSElPQkNLS1UzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFKS0JNTzdXWRQLDxIUFQhZ
	QUs3Bg++
X-HM-Tid: 0a82b0b66d6f8d31kuqt182ab6b98d8
Cc: Philipp Reisner <philipp.reisner@linbit.com>, dongsheng.yang@easystack.cn,
	drbd-dev@lists.linbit.com
Subject: Re: [Drbd-dev]
	=?utf-8?q?=5BPATCH=5D_drbd=3A_retry_the_IO_when_connec?=
	=?utf-8?q?tion_lost?=
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
Content-Type: multipart/mixed; boundary="===============4226380839929193783=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============4226380839929193783==
Content-Type: multipart/alternative; BOUNDARY="=_Part_69581_2017142229.1660823249569"

--=_Part_69581_2017142229.1660823249569
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKICAgICBJIGhhdmUgc2VudCBhIG5ldyBwYXRjaCBmb3IgaXQuIEZvciB0aG9zZSBy
ZXF1ZXN0cyB0aGF0IGFyZSBjb21wbGV0ZWQsIGJ1dCBmb3Igd2hpY2ggbm8KYmFycmllciBhY2sg
aGFzIHlldCBiZWVuIHJlY2VpdmVkLCB3ZSBjYW4ganVzdCBtYXJrIHRoZSBjb3JyZXNwb25kaW5n
IGJsb2NrIGFzIG91dCBvZiBzeW5jLgpUaGVuIHRob3NlIGJsb2NrcyB3aWxsIGJlIHJlc3luY2Vk
IHdoZW4gY29ubmVjdGlvbiBpcyByZS1lc3RhYmxpc2hlZC4KQmVzdCByZWdhcmRzLApYdQoKCgoK
CgoKCkZyb206IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVkZ2VAbGluYml0LmNvbT4KRGF0ZTog
MjAyMi0wOC0xMyAwMDozMzoyNApUbzogIFJ1aSBYdSA8cnVpLnh1QGVhc3lzdGFjay5jbj4KQ2M6
ICBQaGlsaXBwIFJlaXNuZXIgPHBoaWxpcHAucmVpc25lckBsaW5iaXQuY29tPixkcmJkLWRldkBs
aXN0cy5saW5iaXQuY29tLGRvbmdzaGVuZy55YW5nQGVhc3lzdGFjay5jbgpTdWJqZWN0OiBSZTog
W1BBVENIXSBkcmJkOiByZXRyeSB0aGUgSU8gd2hlbiBjb25uZWN0aW9uIGxvc3Q+SGkgWHUsCj4K
Pj4gQW5kIGl0J3Mgc2ltcGxlciB0aGFuIHRoZSBjdXJyZW50IG1lY2hhbmlzbS4KPgo+SXQgY2Vy
dGFpbmx5IGlzLgo+Cj5VbmZvcnR1bmF0ZWx5IGl0IGJyZWFrcyBvdGhlciB0aGluZ3MuIEkgd2ls
bCBub3QgY29tbWVudCBvbiBkZXRhaWxzIG9mCj50aGUgY29kZSwgYnV0IHJhdGhlciBvbiB0aGUg
Y29yZSBhcmNoaXRlY3R1cmFsIGNvbmNlcm4uCj4KPkkgYmVsaWV2ZSByZXF1ZXN0cyB0aGF0IHdl
cmUgbm90IHlldCBjb21wbGV0ZWQgY291bGQgYmUgcmV0cmllZCBhcyB5b3UgcHJvcG9zZS4KPgo+
VGhlIGRpZmZpY3VsdCByZXF1ZXN0cyBhcmUgdGhvc2UgdGhhdCBhcmUgY29tcGxldGVkLCBidXQg
Zm9yIHdoaWNoIG5vCj5iYXJyaWVyIGFjayBoYXMgeWV0IGJlZW4gcmVjZWl2ZWQuIFRoZXNlIHJl
cXVlc3RzIG1heSBub3QgeWV0IGhhdmUKPmJlZW4gcGVyc2lzdGVkIG9uIHRoZSBwZWVyLCBldmVu
IHdpdGggcHJvdG9jb2wgQy4gT25seSBvbmNlIHRoZQo+YmFycmllciBhY2sgaGFzIGJlZW4gcmVj
ZWl2ZWQgZG8gd2Uga25vdyB0aGF0IHRoZSB3cml0ZSBoYXMgYmVlbgo+cGVyc2lzdGVkLiBVbnRp
bCB0aGVuIHRoZSBwZWVyIG1pZ2h0IGxvc2UgdGhlIHdyaXRlIGlmIGl0IGNyYXNoZXMuCj4KPlVu
dGlsIHdlIHJlZ2FpbiBxdW9ydW0sIHdlIGRvIG5vdCBrbm93IHdoYXQgdG8gZG8gd2l0aCBzdWNo
IHJlcXVlc3RzLgo+VGhlcmUgYXJlIDIgcG9zc2liaWxpdGllczoKPmEpIEl0IG1heSBiZSB0aGF0
IG9ubHkgYSBuZXR3b3JrIG91dGFnZSBvY2N1cnJlZC4gSW4gdGhpcyBjYXNlIHdlIHdhbnQKPnRv
IHJlc3VtZSB3aXRob3V0IGEgcmVzeW5jLgo+YikgSXQgbWF5IGJlIHRoYXQgdGhlIHBlZXIgY3Jh
c2hlZC4gSW4gdGhpcyBjYXNlIHdlIG5lZWQgdG8gcGVyZm9ybSBhCj5yZXN5bmMgaW5jbHVkaW5n
IHRoZSBibG9ja3MgY29ycmVzcG9uZGluZyB0byB0aGVzZSByZXF1ZXN0cy4KPgo+V2Uga2VlcCB0
aGUgcmVxdWVzdHMgaW4gdGhlIHRyYW5zZmVyIGxvZyB1bnRpbCB3ZSByZWdhaW4gcXVvcnVtLCBz
bwo+dGhhdCB3ZSBrbm93IHdoZXRoZXIgd2UgYXJlIGluIHNpdHVhdGlvbiBhKSBvciBiKS4KPgo+
WW91ciBwYXRjaCBhc3N1bWVzIHRoYXQgIk9LIiByZXF1ZXN0cyBjYW4gYmUgYXNzdW1lZCB0byBo
YXZlIGJlZW4KPnBlcnNpc3RlZCBvbiB0aGUgcGVlcjoKPisgfSBlbHNlIGlmIChyZXEtPm5ldF9y
cV9zdGF0ZVtpZHhdICYgUlFfTkVUX09LKSB7Cj4rIGdvdG8gYmFycmllcl9hY2tlZDsKPgo+VGhh
dCBpcywgdGhlIHBhdGNoIGFzc3VtZXMgdGhhdCBzaXR1YXRpb24gYSkgd2lsbCBvY2N1ci4gSWYg
YikKPmFjdHVhbGx5IG9jY3VycmVkLCB0aGVuIHRoZSBuZWNlc3NhcnkgYmxvY2tzIHdpbGwgbm90
IGJlIHJlc3luY2VkIGFuZAo+dGhpcyBjb3VsZCBjYXVzZSBkYXRhIGNvcnJ1cHRpb24uCj4KPkkg
YW0gdmVyeSByZWFkeSB0byBiZWxpZXZlIHRoYXQgdGhlcmUgaXMgYSBzaW1wbGVyIHdheSBvZiBk
ZWFsaW5nIHdpdGgKPnN1c3BlbmRlZCByZXF1ZXN0cywgYnV0IGl0IG11c3QgaGFuZGxlIHRoZXNl
IGRpZmZlcmVudCBwb3NzaWJpbGl0aWVzLgo+Cj4+IE15IHRlc3QgYWxzbyBtZWV0IGEgcHJvYmxl
bSBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCAzMzYwMGE0NjMyZjIuCj4+IEkgaGF2ZSB0aHJlZSBub2Rl
cyBydW5uaW5nIHdpdGggZHJiZDkuMShub2RlLTEsIG5vZGUtMiBhbmQgbm9kZS0zKSwKPj4gbm9k
ZS0xIGlzIHByaW1hcnkgYW5kIG90aGVyIG5vZGVzIGFyZSBzZWNvbmRhcnkuIEJvdGggcXVvcnVt
IGFuZAo+PiBxdW9ydW0tbWluaW11bS1yZWR1bmRhbmN5IGFyZSBzZXQgdG8gMi4KPgo+SW5kZWVk
LCB0aGUgcXVvcnVtLW1pbmltdW0tcmVkdW5kYW5jeSBpbXBsZW1lbnRhdGlvbiBpcyBub3cgc3Ry
aWN0ZXIuCj5QcmV2aW91c2x5IGl0IGFsbG93ZWQgcmVxdWVzdHMgdG8gY29tcGxldGUgd2hpY2gg
c2hvdWxkIG5vdCBoYXZlIGJlZW4KPmFsbG93ZWQgdG8uIFRoZSBzdHJpY3RlciBpbXBsZW1lbnRh
dGlvbiBpbnRyb2R1Y2VzIHNvbWUgdHJpY2t5IGNvcm5lcgo+Y2FzZXMgd2hpY2ggbWFrZSBpdCBo
YXJkIHRvIHVzZS4gSSByZWNvbW1lbmQgdGhhdCB5b3UgZG8gbm90IHVzZSBpdAo+dW5sZXNzIHlv
dSBhcmUgcmVhbGx5IGNlcnRhaW4gdGhhdCB5b3UgbmVlZCBpdC4gVGhlcmUgbWF5IGhhdmUgYmVl
bgo+c29tZSBjb25mdXNpbmcgcmVjb21tZW5kYXRpb25zIGluIHRoZSBwYXN0LiBJIHJlY29tbWVu
ZGVkIGl0IGZvciBhCj53aGlsZS4gTm93IGl0IGlzIG5vdCByZWNvbW1lbmRlZCB0byB1c2UgcXVv
cnVtLW1pbmltdW0tcmVkdW5kYW5jeSBpbgo+Z2VuZXJhbC4KPgo+QmVzdCByZWdhcmRzLAo+Sm9l
bAoKCg0KDQo=
--=_Part_69581_2017142229.1660823249569
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PiZuYnNwOyZuYnNwOyZu
YnNwOyZuYnNwOyBJIGhhdmUgc2VudCBhIG5ldyBwYXRjaCBmb3IgaXQuIEZvciB0aG9zZSByZXF1
ZXN0cyB0aGF0IGFyZSBjb21wbGV0ZWQsIGJ1dCBmb3Igd2hpY2ggbm88L2Rpdj48ZGl2PmJhcnJp
ZXIgYWNrIGhhcyB5ZXQgYmVlbiByZWNlaXZlZCwgd2UgY2FuIGp1c3QgbWFyayB0aGUgY29ycmVz
cG9uZGluZyBibG9jayBhcyBvdXQgb2Ygc3luYy48L2Rpdj48ZGl2PlRoZW4gdGhvc2UgYmxvY2tz
IHdpbGwgYmUgcmVzeW5jZWQgd2hlbiBjb25uZWN0aW9uIGlzIHJlLWVzdGFibGlzaGVkLjwvZGl2
PjxkaXY+QmVzdCByZWdhcmRzLDwvZGl2PjxkaXY+WHU8YnI+PC9kaXY+PGJyPjxicj48YnI+PGJy
PjxkaXYgIHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2ZTt6b29tOjEiPjwvZGl2Pjxicj48cHJlPjxi
cj5Gcm9tOiBKb2VsIENvbGxlZGdlICZsdDtqb2VsLmNvbGxlZGdlQGxpbmJpdC5jb20mZ3Q7CkRh
dGU6IDIwMjItMDgtMTMgMDA6MzM6MjQKVG86ICBSdWkgWHUgJmx0O3J1aS54dUBlYXN5c3RhY2su
Y24mZ3Q7CkNjOiAgUGhpbGlwcCBSZWlzbmVyICZsdDtwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNv
bSZndDssZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbSxkb25nc2hlbmcueWFuZ0BlYXN5c3RhY2su
Y24KU3ViamVjdDogUmU6IFtQQVRDSF0gZHJiZDogcmV0cnkgdGhlIElPIHdoZW4gY29ubmVjdGlv
biBsb3N0Jmd0O0hpIFh1LAomZ3Q7CiZndDsmZ3Q7IEFuZCBpdCdzIHNpbXBsZXIgdGhhbiB0aGUg
Y3VycmVudCBtZWNoYW5pc20uCiZndDsKJmd0O0l0IGNlcnRhaW5seSBpcy4KJmd0OwomZ3Q7VW5m
b3J0dW5hdGVseSBpdCBicmVha3Mgb3RoZXIgdGhpbmdzLiBJIHdpbGwgbm90IGNvbW1lbnQgb24g
ZGV0YWlscyBvZgomZ3Q7dGhlIGNvZGUsIGJ1dCByYXRoZXIgb24gdGhlIGNvcmUgYXJjaGl0ZWN0
dXJhbCBjb25jZXJuLgomZ3Q7CiZndDtJIGJlbGlldmUgcmVxdWVzdHMgdGhhdCB3ZXJlIG5vdCB5
ZXQgY29tcGxldGVkIGNvdWxkIGJlIHJldHJpZWQgYXMgeW91IHByb3Bvc2UuCiZndDsKJmd0O1Ro
ZSBkaWZmaWN1bHQgcmVxdWVzdHMgYXJlIHRob3NlIHRoYXQgYXJlIGNvbXBsZXRlZCwgYnV0IGZv
ciB3aGljaCBubwomZ3Q7YmFycmllciBhY2sgaGFzIHlldCBiZWVuIHJlY2VpdmVkLiBUaGVzZSBy
ZXF1ZXN0cyBtYXkgbm90IHlldCBoYXZlCiZndDtiZWVuIHBlcnNpc3RlZCBvbiB0aGUgcGVlciwg
ZXZlbiB3aXRoIHByb3RvY29sIEMuIE9ubHkgb25jZSB0aGUKJmd0O2JhcnJpZXIgYWNrIGhhcyBi
ZWVuIHJlY2VpdmVkIGRvIHdlIGtub3cgdGhhdCB0aGUgd3JpdGUgaGFzIGJlZW4KJmd0O3BlcnNp
c3RlZC4gVW50aWwgdGhlbiB0aGUgcGVlciBtaWdodCBsb3NlIHRoZSB3cml0ZSBpZiBpdCBjcmFz
aGVzLgomZ3Q7CiZndDtVbnRpbCB3ZSByZWdhaW4gcXVvcnVtLCB3ZSBkbyBub3Qga25vdyB3aGF0
IHRvIGRvIHdpdGggc3VjaCByZXF1ZXN0cy4KJmd0O1RoZXJlIGFyZSAyIHBvc3NpYmlsaXRpZXM6
CiZndDthKSBJdCBtYXkgYmUgdGhhdCBvbmx5IGEgbmV0d29yayBvdXRhZ2Ugb2NjdXJyZWQuIElu
IHRoaXMgY2FzZSB3ZSB3YW50CiZndDt0byByZXN1bWUgd2l0aG91dCBhIHJlc3luYy4KJmd0O2Ip
IEl0IG1heSBiZSB0aGF0IHRoZSBwZWVyIGNyYXNoZWQuIEluIHRoaXMgY2FzZSB3ZSBuZWVkIHRv
IHBlcmZvcm0gYQomZ3Q7cmVzeW5jIGluY2x1ZGluZyB0aGUgYmxvY2tzIGNvcnJlc3BvbmRpbmcg
dG8gdGhlc2UgcmVxdWVzdHMuCiZndDsKJmd0O1dlIGtlZXAgdGhlIHJlcXVlc3RzIGluIHRoZSB0
cmFuc2ZlciBsb2cgdW50aWwgd2UgcmVnYWluIHF1b3J1bSwgc28KJmd0O3RoYXQgd2Uga25vdyB3
aGV0aGVyIHdlIGFyZSBpbiBzaXR1YXRpb24gYSkgb3IgYikuCiZndDsKJmd0O1lvdXIgcGF0Y2gg
YXNzdW1lcyB0aGF0ICJPSyIgcmVxdWVzdHMgY2FuIGJlIGFzc3VtZWQgdG8gaGF2ZSBiZWVuCiZn
dDtwZXJzaXN0ZWQgb24gdGhlIHBlZXI6CiZndDsrIH0gZWxzZSBpZiAocmVxLSZndDtuZXRfcnFf
c3RhdGVbaWR4XSAmYW1wOyBSUV9ORVRfT0spIHsKJmd0OysgZ290byBiYXJyaWVyX2Fja2VkOwom
Z3Q7CiZndDtUaGF0IGlzLCB0aGUgcGF0Y2ggYXNzdW1lcyB0aGF0IHNpdHVhdGlvbiBhKSB3aWxs
IG9jY3VyLiBJZiBiKQomZ3Q7YWN0dWFsbHkgb2NjdXJyZWQsIHRoZW4gdGhlIG5lY2Vzc2FyeSBi
bG9ja3Mgd2lsbCBub3QgYmUgcmVzeW5jZWQgYW5kCiZndDt0aGlzIGNvdWxkIGNhdXNlIGRhdGEg
Y29ycnVwdGlvbi4KJmd0OwomZ3Q7SSBhbSB2ZXJ5IHJlYWR5IHRvIGJlbGlldmUgdGhhdCB0aGVy
ZSBpcyBhIHNpbXBsZXIgd2F5IG9mIGRlYWxpbmcgd2l0aAomZ3Q7c3VzcGVuZGVkIHJlcXVlc3Rz
LCBidXQgaXQgbXVzdCBoYW5kbGUgdGhlc2UgZGlmZmVyZW50IHBvc3NpYmlsaXRpZXMuCiZndDsK
Jmd0OyZndDsgTXkgdGVzdCBhbHNvIG1lZXQgYSBwcm9ibGVtIGludHJvZHVjZWQgYnkgY29tbWl0
IDMzNjAwYTQ2MzJmMi4KJmd0OyZndDsgSSBoYXZlIHRocmVlIG5vZGVzIHJ1bm5pbmcgd2l0aCBk
cmJkOS4xKG5vZGUtMSwgbm9kZS0yIGFuZCBub2RlLTMpLAomZ3Q7Jmd0OyBub2RlLTEgaXMgcHJp
bWFyeSBhbmQgb3RoZXIgbm9kZXMgYXJlIHNlY29uZGFyeS4gQm90aCBxdW9ydW0gYW5kCiZndDsm
Z3Q7IHF1b3J1bS1taW5pbXVtLXJlZHVuZGFuY3kgYXJlIHNldCB0byAyLgomZ3Q7CiZndDtJbmRl
ZWQsIHRoZSBxdW9ydW0tbWluaW11bS1yZWR1bmRhbmN5IGltcGxlbWVudGF0aW9uIGlzIG5vdyBz
dHJpY3Rlci4KJmd0O1ByZXZpb3VzbHkgaXQgYWxsb3dlZCByZXF1ZXN0cyB0byBjb21wbGV0ZSB3
aGljaCBzaG91bGQgbm90IGhhdmUgYmVlbgomZ3Q7YWxsb3dlZCB0by4gVGhlIHN0cmljdGVyIGlt
cGxlbWVudGF0aW9uIGludHJvZHVjZXMgc29tZSB0cmlja3kgY29ybmVyCiZndDtjYXNlcyB3aGlj
aCBtYWtlIGl0IGhhcmQgdG8gdXNlLiBJIHJlY29tbWVuZCB0aGF0IHlvdSBkbyBub3QgdXNlIGl0
CiZndDt1bmxlc3MgeW91IGFyZSByZWFsbHkgY2VydGFpbiB0aGF0IHlvdSBuZWVkIGl0LiBUaGVy
ZSBtYXkgaGF2ZSBiZWVuCiZndDtzb21lIGNvbmZ1c2luZyByZWNvbW1lbmRhdGlvbnMgaW4gdGhl
IHBhc3QuIEkgcmVjb21tZW5kZWQgaXQgZm9yIGEKJmd0O3doaWxlLiBOb3cgaXQgaXMgbm90IHJl
Y29tbWVuZGVkIHRvIHVzZSBxdW9ydW0tbWluaW11bS1yZWR1bmRhbmN5IGluCiZndDtnZW5lcmFs
LgomZ3Q7CiZndDtCZXN0IHJlZ2FyZHMsCiZndDtKb2VsCjwvcHJlPjwvZGl2Pjxicj4=
--=_Part_69581_2017142229.1660823249569--

--===============4226380839929193783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============4226380839929193783==--
