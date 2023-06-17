Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 63D5B7340A2
	for <lists+drbd-dev@lfdr.de>; Sat, 17 Jun 2023 14:12:56 +0200 (CEST)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B95C94252BC;
	Sat, 17 Jun 2023 14:12:55 +0200 (CEST)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
Received: from us-smtp-delivery-124.mimecast.com
	(us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 5B44D4205F5
	for <drbd-dev@lists.linbit.com>; Sat, 17 Jun 2023 14:12:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687003973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=2HlaXseyq5U5o1i8LIFlWuZ5rATyuHBFais1x2nt408=;
	b=A1tvEFrkFOpUr1bfQ2stbyJuMJx+jAjXG3/NDpy/UIoZR3zf9tE9/9gpBx8Mt/wsq6OCU6
	K3clIRwb2S1uKJUUMvGRJK6xrNm+FJjay20Xov387AgHQ1USMd4zFpW2yFYkYrWC6ypADq
	30Q58onDsc7WH9znOQu1QG1nEcrAWd0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
	[66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
	(version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	us-mta-117-NmwNDhxxO3e69TbO3-hfEA-1; Sat, 17 Jun 2023 08:12:49 -0400
X-MC-Unique: NmwNDhxxO3e69TbO3-hfEA-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
	[10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 35E311C08782;
	Sat, 17 Jun 2023 12:12:48 +0000 (UTC)
Received: from warthog.procyon.org.com (unknown [10.42.28.51])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 30CB0492C1B;
	Sat, 17 Jun 2023 12:12:46 +0000 (UTC)
From: David Howells <dhowells@redhat.com>
To: netdev@vger.kernel.org
Date: Sat, 17 Jun 2023 13:11:42 +0100
Message-ID: <20230617121146.716077-14-dhowells@redhat.com>
In-Reply-To: <20230617121146.716077-1-dhowells@redhat.com>
References: <20230617121146.716077-1-dhowells@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Cc: Jens Axboe <axboe@kernel.dk>, linux-block@vger.kernel.org,
	Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	David Ahern <dsahern@kernel.org>, linux-kernel@vger.kernel.org,
	Alexander Duyck <alexander.duyck@gmail.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	David Howells <dhowells@redhat.com>, linux-mm@kvack.org,
	Eric Dumazet <edumazet@google.com>, Matthew Wilcox <willy@infradead.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Lars Ellenberg <lars.ellenberg@linbit.com>,
	Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>,
	drbd-dev@lists.linbit.com
Subject: [Drbd-dev] [PATCH net-next v2 13/17] drbd: Use
	sendmsg(MSG_SPLICE_PAGES) rather than sendpage()
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

VXNlIHNlbmRtc2coKSBjb25kaXRpb25hbGx5IHdpdGggTVNHX1NQTElDRV9QQUdFUyBpbiBfZHJi
ZF9zZW5kX3BhZ2UoKQpyYXRoZXIgdGhhbiBjYWxsaW5nIHNlbmRwYWdlKCkgb3IgX2RyYmRfbm9f
c2VuZF9wYWdlKCkuCgpTaWduZWQtb2ZmLWJ5OiBEYXZpZCBIb3dlbGxzIDxkaG93ZWxsc0ByZWRo
YXQuY29tPgpjYzogUGhpbGlwcCBSZWlzbmVyIDxwaGlsaXBwLnJlaXNuZXJAbGluYml0LmNvbT4K
Y2M6IExhcnMgRWxsZW5iZXJnIDxsYXJzLmVsbGVuYmVyZ0BsaW5iaXQuY29tPgpjYzogIkNocmlz
dG9waCBCw7ZobXdhbGRlciIgPGNocmlzdG9waC5ib2VobXdhbGRlckBsaW5iaXQuY29tPgpjYzog
SmVucyBBeGJvZSA8YXhib2VAa2VybmVsLmRrPgpjYzogIkRhdmlkIFMuIE1pbGxlciIgPGRhdmVt
QGRhdmVtbG9mdC5uZXQ+CmNjOiBFcmljIER1bWF6ZXQgPGVkdW1hemV0QGdvb2dsZS5jb20+CmNj
OiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpjYzogUGFvbG8gQWJlbmkgPHBhYmVu
aUByZWRoYXQuY29tPgpjYzogZHJiZC1kZXZAbGlzdHMubGluYml0LmNvbQpjYzogbGludXgtYmxv
Y2tAdmdlci5rZXJuZWwub3JnCmNjOiBuZXRkZXZAdmdlci5rZXJuZWwub3JnCi0tLQoKTm90ZXM6
CiAgICB2ZXIgIzIpCiAgICAgLSBXcmFwIGxpbmVzIGF0IDgwLgoKIGRyaXZlcnMvYmxvY2svZHJi
ZC9kcmJkX21haW4uYyB8IDI1ICsrKysrKysrKysrKysrLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWluLmMgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmMKaW5kZXggODM5ODdlN2E1ZWYyLi44YTAxYTE4YTI1NTAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
YmxvY2svZHJiZC9kcmJkX21haW4uYworKysgYi9kcml2ZXJzL2Jsb2NrL2RyYmQvZHJiZF9tYWlu
LmMKQEAgLTE1NDAsNyArMTU0MCw4IEBAIHN0YXRpYyBpbnQgX2RyYmRfc2VuZF9wYWdlKHN0cnVj
dCBkcmJkX3BlZXJfZGV2aWNlICpwZWVyX2RldmljZSwgc3RydWN0IHBhZ2UgKnBhCiAJCSAgICBp
bnQgb2Zmc2V0LCBzaXplX3Qgc2l6ZSwgdW5zaWduZWQgbXNnX2ZsYWdzKQogewogCXN0cnVjdCBz
b2NrZXQgKnNvY2tldCA9IHBlZXJfZGV2aWNlLT5jb25uZWN0aW9uLT5kYXRhLnNvY2tldDsKLQlp
bnQgbGVuID0gc2l6ZTsKKwlzdHJ1Y3QgYmlvX3ZlYyBidmVjOworCXN0cnVjdCBtc2doZHIgbXNn
ID0geyAubXNnX2ZsYWdzID0gbXNnX2ZsYWdzLCB9OwogCWludCBlcnIgPSAtRUlPOwogCiAJLyog
ZS5nLiBYRlMgbWV0YS0gJiBsb2ctZGF0YSBpcyBpbiBzbGFiIHBhZ2VzLCB3aGljaCBoYXZlIGEK
QEAgLTE1NDksMzMgKzE1NTAsMzUgQEAgc3RhdGljIGludCBfZHJiZF9zZW5kX3BhZ2Uoc3RydWN0
IGRyYmRfcGVlcl9kZXZpY2UgKnBlZXJfZGV2aWNlLCBzdHJ1Y3QgcGFnZSAqcGEKIAkgKiBwdXRf
cGFnZSgpOyBhbmQgd291bGQgY2F1c2UgZWl0aGVyIGEgVk1fQlVHIGRpcmVjdGx5LCBvcgogCSAq
IF9fcGFnZV9jYWNoZV9yZWxlYXNlIGEgcGFnZSB0aGF0IHdvdWxkIGFjdHVhbGx5IHN0aWxsIGJl
IHJlZmVyZW5jZWQKIAkgKiBieSBzb21lb25lLCBsZWFkaW5nIHRvIHNvbWUgb2JzY3VyZSBkZWxh
eWVkIE9vcHMgc29tZXdoZXJlIGVsc2UuICovCi0JaWYgKGRyYmRfZGlzYWJsZV9zZW5kcGFnZSB8
fCAhc2VuZHBhZ2Vfb2socGFnZSkpCi0JCXJldHVybiBfZHJiZF9ub19zZW5kX3BhZ2UocGVlcl9k
ZXZpY2UsIHBhZ2UsIG9mZnNldCwgc2l6ZSwgbXNnX2ZsYWdzKTsKKwlpZiAoIWRyYmRfZGlzYWJs
ZV9zZW5kcGFnZSAmJiBzZW5kcGFnZV9vayhwYWdlKSkKKwkJbXNnLm1zZ19mbGFncyB8PSBNU0df
Tk9TSUdOQUwgfCBNU0dfU1BMSUNFX1BBR0VTOworCisJYnZlY19zZXRfcGFnZSgmYnZlYywgcGFn
ZSwgb2Zmc2V0LCBzaXplKTsKKwlpb3ZfaXRlcl9idmVjKCZtc2cubXNnX2l0ZXIsIElURVJfU09V
UkNFLCAmYnZlYywgMSwgc2l6ZSk7CiAKLQltc2dfZmxhZ3MgfD0gTVNHX05PU0lHTkFMOwogCWRy
YmRfdXBkYXRlX2Nvbmdlc3RlZChwZWVyX2RldmljZS0+Y29ubmVjdGlvbik7CiAJZG8gewogCQlp
bnQgc2VudDsKIAotCQlzZW50ID0gc29ja2V0LT5vcHMtPnNlbmRwYWdlKHNvY2tldCwgcGFnZSwg
b2Zmc2V0LCBsZW4sIG1zZ19mbGFncyk7CisJCXNlbnQgPSBzb2NrX3NlbmRtc2coc29ja2V0LCAm
bXNnKTsKIAkJaWYgKHNlbnQgPD0gMCkgewogCQkJaWYgKHNlbnQgPT0gLUVBR0FJTikgewogCQkJ
CWlmICh3ZV9zaG91bGRfZHJvcF90aGVfY29ubmVjdGlvbihwZWVyX2RldmljZS0+Y29ubmVjdGlv
biwgc29ja2V0KSkKIAkJCQkJYnJlYWs7CiAJCQkJY29udGludWU7CiAJCQl9Ci0JCQlkcmJkX3dh
cm4ocGVlcl9kZXZpY2UtPmRldmljZSwgIiVzOiBzaXplPSVkIGxlbj0lZCBzZW50PSVkXG4iLAot
CQkJICAgICBfX2Z1bmNfXywgKGludClzaXplLCBsZW4sIHNlbnQpOworCQkJZHJiZF93YXJuKHBl
ZXJfZGV2aWNlLT5kZXZpY2UsICIlczogc2l6ZT0lZCBsZW49JXp1IHNlbnQ9JWRcbiIsCisJCQkJ
ICBfX2Z1bmNfXywgKGludClzaXplLCBtc2dfZGF0YV9sZWZ0KCZtc2cpLAorCQkJCSAgc2VudCk7
CiAJCQlpZiAoc2VudCA8IDApCiAJCQkJZXJyID0gc2VudDsKIAkJCWJyZWFrOwogCQl9Ci0JCWxl
biAgICAtPSBzZW50OwotCQlvZmZzZXQgKz0gc2VudDsKLQl9IHdoaWxlIChsZW4gPiAwIC8qIFRI
SU5LICYmIGRldmljZS0+Y3N0YXRlID49IENfQ09OTkVDVEVEKi8pOworCX0gd2hpbGUgKG1zZ19k
YXRhX2xlZnQoJm1zZykKKwkJIC8qIFRISU5LICYmIGRldmljZS0+Y3N0YXRlID49IENfQ09OTkVD
VEVEKi8pOwogCWNsZWFyX2JpdChORVRfQ09OR0VTVEVELCAmcGVlcl9kZXZpY2UtPmNvbm5lY3Rp
b24tPmZsYWdzKTsKIAotCWlmIChsZW4gPT0gMCkgeworCWlmICghbXNnX2RhdGFfbGVmdCgmbXNn
KSkgewogCQllcnIgPSAwOwogCQlwZWVyX2RldmljZS0+ZGV2aWNlLT5zZW5kX2NudCArPSBzaXpl
ID4+IDk7CiAJfQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KZHJiZC1kZXYgbWFpbGluZyBsaXN0CmRyYmQtZGV2QGxpc3RzLmxpbmJpdC5jb20KaHR0cHM6
Ly9saXN0cy5saW5iaXQuY29tL21haWxtYW4vbGlzdGluZm8vZHJiZC1kZXYK
