Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB63522BEF
	for <lists+drbd-dev@lfdr.de>; Wed, 11 May 2022 07:55:07 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 3739F420621;
	Wed, 11 May 2022 07:55:06 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from mail-m24100.qiye.163.com (mail-m24100.qiye.163.com
	[220.194.24.100])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id E2D8D420372
	for <drbd-dev@lists.linbit.com>; Wed, 11 May 2022 07:55:03 +0200 (CEST)
Received: from easystack.cn (localhost [127.0.0.1])
	by mail-m24100.qiye.163.com (Hmail) with ESMTP id E8C9D560145;
	Wed, 11 May 2022 13:55:01 +0800 (CST)
Message-ID: <ABEAGAAXIWGeUYOCD1PNhaqL.3.1652248501946.Hmail.rui.xu@easystack.cn>
To: Joel Colledge <joel.colledge@linbit.com>
X-Priority: 3
X-Mailer: HMail Webmail Server V2.0 Copyright (c) 2015-163.com
X-Originating-IP: 218.94.118.90
In-Reply-To: <CAGNP_+VQDpNfrDgWLDc0F1Va-Fnt5VEAFreXVn7ufiq6R_OJTQ@mail.gmail.com>
MIME-Version: 1.0
Received: from rui.xu@easystack.cn( [218.94.118.90) ] by ajax-webmail (
	[127.0.0.1] ) ; Wed, 11 May 2022 13:55:01 +0800 (GMT+08:00)
From: "rui.xu" <rui.xu@easystack.cn>
Date: Wed, 11 May 2022 13:55:01 +0800 (GMT+08:00)
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUlCN1dZLVlBSVdZDwkaFQgSH1lBWRoYHhhWTEoeTkhIQkwZSU
	JLVRkRExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kJHlYWEh9ZQUpPT0hISUpDTU1CQjdXWQweGVlBDwkOHldZEh8eFQ9Z
	QVlHOjk#Ojw6OiMyLDweLiI0OD9KKzUTGgo3VUhVSk1OSUlPQ05LSUpJSVUzFhoSF1UJDhJVAw47
	HhoIAggPGhgQVRgVRVlXWRILWUFZSUpDVUJPVUpKQ1VCS1lXWQgBWUFMTEtMN1dZFAsPEhQVCFlB
	SzcG
X-HM-Tid: 0a80b19d9a608c39kuqt1809496587b
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
Content-Type: multipart/mixed; boundary="===============0156729648807306793=="
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

--===============0156729648807306793==
Content-Type: multipart/alternative; BOUNDARY="=_Part_400365_1187771957.1652248501946"

--=_Part_400365_1187771957.1652248501946
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64

SGkgSm9lbCwKCgpGb3IgdGhlIGZpcnN0IHF1ZXN0aW9uLCB3ZSBoYXZlIGFub3RoZXIgY29tcG9u
ZW50IGluIG91ciBzeXN0ZW0gaW1wbGVtZW50cyBwYXhvcyBhbmQgcHJvdmlkZSBkaXN0cmlidXRl
IGxvY2suCgpXaGVuICB0aGUgbmV0d29yayBjb25uZWN0aW9uIGJldHdlZW4gdHdvIG5vZGVzIGlz
IGRpc2Nvbm5lY3RlZCwgdGhlIGZpcnN0IG5vZGUgdGhhdCBjYW4gZ2V0IHRoZSBkaXN0cmlidXRl
ZCBsb2NrCndpbGwgY29udGludWUgdG8gcHJvdmlkZSBzZXJ2aWNlcywgc28gd2UgY2FuIGhhbmRs
ZSB0aGlzIGNhc2UuCgoKRm9yIHRoZSBzZWNvbmQgcXVlc3Rpb24sIHdlIGhhdmUgdG8gdXNlIGlT
Q1NJIGluIG15IGNhc2UuCgoKCkZvciB0aGUgbGFzdCBxdWVzdGlvbiwgd2UgaGF2ZSBpbXBsZW1l
bnRlZCBvdXIgb3duIGNsdXN0ZXIgbWFuYWdlciwgdGhlIGZpcnN0IHZlcnNpb24gZm9yIGZhaWxv
dmVyIGlzIHNhbWUgd2l0aCB3aGF0IHlvdSBzdWdnZXN0ZWQuCgpCdXQgaW4gbXkgdXNlLWNhc2Us
IGl0IGludHJvZHVjZSBtdWNoIElPLW5vbi1yZXNwb25zZSB0aW1lIGluIGZhaWxvdmVyLiBTbyB3
ZSB3YW50IHRvIHByb3ZpZGUgdHdvIGFjdGl2ZSBpc2NzaSBwYXRoZXMgZm9yIGNsaWVudCB0aGVu
Cgp0aGUgY2xpZW50IGNhbiBkbyBmYWlsb3ZlciBieSBoaXMgbXVsdGlwYXRoIHNvZnR3YXJlLiAK
CgoKQmVzdCByZWdhcmRzLApYdQoKCgoKCkZyb206IEpvZWwgQ29sbGVkZ2UgPGpvZWwuY29sbGVk
Z2VAbGluYml0LmNvbT4KRGF0ZTogMjAyMi0wNS0xMCAyMDo1NToxNQpUbzogICJydWkueHUiIDxy
dWkueHVAZWFzeXN0YWNrLmNuPgpDYzogIFBoaWxpcHAgUmVpc25lciA8cGhpbGlwcC5yZWlzbmVy
QGxpbmJpdC5jb20+LGRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20sZG9uZ3NoZW5nLnlhbmdAZWFz
eXN0YWNrLmNuClN1YmplY3Q6IFJlOiBSZTogZHJiZDogYSBwcm9wb3NhbCBvZiB0d28tcHJpbWFy
aWVzIG1vZGU+SGkgWHUsCj4KPkR1YWwgcHJpbWFyeSBtb2RlIGlzIG5vdCByZWNvbW1lbmRlZCBm
b3IgdGhpcyBzY2VuYXJpbyBkdWUgdG8gZGF0YQo+ZGl2ZXJnZW5jZSBjb25zaWRlcmF0aW9ucy4g
SG93IGRvIHlvdSBoYW5kbGUgYSBsb3NzIG9mIG5ldHdvcmsKPmNvbm5lY3Rpdml0eSBiZXR3ZWVu
IHRoZSBzdG9yYWdlIG5vZGVzPwo+Cj5JcyBpdCBwb3NzaWJsZSB0byB1c2UgZGlza2xlc3MgRFJC
RCBjbGllbnRzIGluc3RlYWQgb2YgaVNDU0kKPmluaXRpYXRvcnMgZm9yIHlvdXIgcHVycG9zZXM/
Cj4KPkFzc3VtaW5nIHlvdSBoYXZlIHRvIHVzZSBpU0NTSSwgdGhlIG5vcm1hbCBzb2x1dGlvbiBp
cyB0byBvbmx5IGhhdmUKPm9uZSBhY3RpdmUgdGFyZ2V0LiBVc2UgYSBjbHVzdGVyIG1hbmFnZXIg
dG8gc3VwcG9ydCBmYWlsb3ZlciB0byB0aGUKPm90aGVyIHN0b3JhZ2Ugbm9kZS4gRm9yIGluc3Rh
bmNlLCBhZGQgYSB0aGlyZCBub2RlIHdpdGggbWluaW1hbAo+cmVzb3VyY2VzIGFzIGEgZGlza2xl
c3MgdGllYnJlYWtlciwgZW5hYmxlIERSQkQgcXVvcnVtLCBhbmQgdXNlIHRoZQo+ZHJiZC1yZWFj
dG9yIHByb21vdGVyIGFzIGEgc2ltcGxlIGNsdXN0ZXIgbWFuYWdlci4gSGF2ZSB5b3UgY29uc2lk
ZXJlZAo+dGhpcyBvcHRpb24/Cj4KPkJlc3QgcmVnYXJkcywKPkpvZWwKCgoNCg0K
--=_Part_400365_1187771957.1652248501946
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0ibGluZS1oZWlnaHQ6MS43O2NvbG9yOiMwMDAwMDA7Zm9udC1zaXplOjE0cHg7
Zm9udC1mYW1pbHk6QXJpYWwiPjxkaXY+SGkgSm9lbCw8L2Rpdj48ZGl2PjxiciAvPjwvZGl2Pjxk
aXY+Rm9yIHRoZSBmaXJzdCBxdWVzdGlvbiwgd2UmbmJzcDtoYXZlJm5ic3A7YW5vdGhlciZuYnNw
O2NvbXBvbmVudCZuYnNwO2luJm5ic3A7b3VyJm5ic3A7c3lzdGVtJm5ic3A7aW1wbGVtZW50cyZu
YnNwO3BheG9zJm5ic3A7YW5kJm5ic3A7cHJvdmlkZSZuYnNwO2Rpc3RyaWJ1dGUmbmJzcDtsb2Nr
LiA8YnIgLz48L2Rpdj48ZGl2PldoZW4mbmJzcDsgdGhlIG5ldHdvcmsgY29ubmVjdGlvbiBiZXR3
ZWVuIHR3byBub2RlcyBpcyBkaXNjb25uZWN0ZWQsIHRoZSBmaXJzdCBub2RlIHRoYXQgY2FuIGdl
dCB0aGUgZGlzdHJpYnV0ZWQgbG9jazwvZGl2PjxkaXY+d2lsbCBjb250aW51ZSB0byBwcm92aWRl
IHNlcnZpY2VzLCBzbyZuYnNwO3dlJm5ic3A7Y2FuJm5ic3A7aGFuZGxlJm5ic3A7dGhpcyZuYnNw
O2Nhc2UuPC9kaXY+PGRpdj48YnIgLz48L2Rpdj48ZGl2PkZvciB0aGUgc2Vjb25kIHF1ZXN0aW9u
LCB3ZSBoYXZlIHRvIHVzZSBpU0NTSSBpbiBteSBjYXNlLjxiciAvPjwvZGl2PjxkaXY+PGJyIC8+
PC9kaXY+PGRpdj5Gb3IgdGhlIGxhc3QgcXVlc3Rpb24sIHdlJm5ic3A7aGF2ZSZuYnNwO2ltcGxl
bWVudGVkJm5ic3A7b3VyJm5ic3A7b3duJm5ic3A7Y2x1c3RlciZuYnNwO21hbmFnZXIsJm5ic3A7
dGhlJm5ic3A7Zmlyc3QmbmJzcDt2ZXJzaW9uJm5ic3A7Zm9yJm5ic3A7ZmFpbG92ZXImbmJzcDtp
cyZuYnNwO3NhbWUmbmJzcDt3aXRoJm5ic3A7d2hhdCZuYnNwO3lvdSZuYnNwO3N1Z2dlc3RlZC4g
PGJyIC8+PC9kaXY+PGRpdj5CdXQgaW4gbXkgdXNlLWNhc2UsIGl0IGludHJvZHVjZSZuYnNwO211
Y2gmbmJzcDtJTy1ub24tcmVzcG9uc2UmbmJzcDt0aW1lJm5ic3A7aW4mbmJzcDtmYWlsb3Zlci4g
U28mbmJzcDt3ZSZuYnNwO3dhbnQmbmJzcDt0byZuYnNwO3Byb3ZpZGUmbmJzcDt0d28mbmJzcDth
Y3RpdmUmbmJzcDtpc2NzaSZuYnNwO3BhdGhlcyZuYnNwO2ZvciZuYnNwO2NsaWVudCZuYnNwO3Ro
ZW4gPGJyIC8+PC9kaXY+PGRpdj50aGUmbmJzcDtjbGllbnQmbmJzcDtjYW4mbmJzcDtkbyZuYnNw
O2ZhaWxvdmVyJm5ic3A7YnkmbmJzcDtoaXMmbmJzcDttdWx0aXBhdGgmbmJzcDtzb2Z0d2FyZS4m
bmJzcDsKCjxiciAvPjwvZGl2PjxkaXY+PGJyIC8+PC9kaXY+PGRpdj5CZXN0IHJlZ2FyZHMsPC9k
aXY+PGRpdj5YdTxiciAvPjwvZGl2PjxiciAvPjxkaXYgIHN0eWxlPSJwb3NpdGlvbjpyZWxhdGl2
ZTt6b29tOjEiPjwvZGl2PjxiciAvPjxwcmU+PGJyIC8+RnJvbTogSm9lbCBDb2xsZWRnZSAmbHQ7
am9lbC5jb2xsZWRnZUBsaW5iaXQuY29tJmd0OwpEYXRlOiAyMDIyLTA1LTEwIDIwOjU1OjE1ClRv
OiAgInJ1aS54dSIgJmx0O3J1aS54dUBlYXN5c3RhY2suY24mZ3Q7CkNjOiAgUGhpbGlwcCBSZWlz
bmVyICZsdDtwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbSZndDssZHJiZC1kZXZAbGlzdHMubGlu
Yml0LmNvbSxkb25nc2hlbmcueWFuZ0BlYXN5c3RhY2suY24KU3ViamVjdDogUmU6IFJlOiBkcmJk
OiBhIHByb3Bvc2FsIG9mIHR3by1wcmltYXJpZXMgbW9kZSZndDtIaSBYdSwKJmd0OwomZ3Q7RHVh
bCBwcmltYXJ5IG1vZGUgaXMgbm90IHJlY29tbWVuZGVkIGZvciB0aGlzIHNjZW5hcmlvIGR1ZSB0
byBkYXRhCiZndDtkaXZlcmdlbmNlIGNvbnNpZGVyYXRpb25zLiBIb3cgZG8geW91IGhhbmRsZSBh
IGxvc3Mgb2YgbmV0d29yawomZ3Q7Y29ubmVjdGl2aXR5IGJldHdlZW4gdGhlIHN0b3JhZ2Ugbm9k
ZXM/CiZndDsKJmd0O0lzIGl0IHBvc3NpYmxlIHRvIHVzZSBkaXNrbGVzcyBEUkJEIGNsaWVudHMg
aW5zdGVhZCBvZiBpU0NTSQomZ3Q7aW5pdGlhdG9ycyBmb3IgeW91ciBwdXJwb3Nlcz8KJmd0Owom
Z3Q7QXNzdW1pbmcgeW91IGhhdmUgdG8gdXNlIGlTQ1NJLCB0aGUgbm9ybWFsIHNvbHV0aW9uIGlz
IHRvIG9ubHkgaGF2ZQomZ3Q7b25lIGFjdGl2ZSB0YXJnZXQuIFVzZSBhIGNsdXN0ZXIgbWFuYWdl
ciB0byBzdXBwb3J0IGZhaWxvdmVyIHRvIHRoZQomZ3Q7b3RoZXIgc3RvcmFnZSBub2RlLiBGb3Ig
aW5zdGFuY2UsIGFkZCBhIHRoaXJkIG5vZGUgd2l0aCBtaW5pbWFsCiZndDtyZXNvdXJjZXMgYXMg
YSBkaXNrbGVzcyB0aWVicmVha2VyLCBlbmFibGUgRFJCRCBxdW9ydW0sIGFuZCB1c2UgdGhlCiZn
dDtkcmJkLXJlYWN0b3IgcHJvbW90ZXIgYXMgYSBzaW1wbGUgY2x1c3RlciBtYW5hZ2VyLiBIYXZl
IHlvdSBjb25zaWRlcmVkCiZndDt0aGlzIG9wdGlvbj8KJmd0OwomZ3Q7QmVzdCByZWdhcmRzLAom
Z3Q7Sm9lbAo8L3ByZT48L2Rpdj48YnI+
--=_Part_400365_1187771957.1652248501946--

--===============0156729648807306793==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev

--===============0156729648807306793==--
