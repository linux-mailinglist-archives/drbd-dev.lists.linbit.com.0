Return-Path: <drbd-dev-bounces@lists.linbit.com>
X-Original-To: lists+drbd-dev@lfdr.de
Delivered-To: lists+drbd-dev@lfdr.de
Received: from mail19.linbit.com (mail19.linbit.com [159.69.154.96])
	by mail.lfdr.de (Postfix) with ESMTPS id 48C1D11DEB1
	for <lists+drbd-dev@lfdr.de>; Fri, 13 Dec 2019 08:31:32 +0100 (CET)
Received: from mail19.linbit.com (localhost [127.0.0.1])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id B3C594203D6;
	Fri, 13 Dec 2019 08:31:28 +0100 (CET)
X-Original-To: drbd-dev@lists.linbit.com
Delivered-To: drbd-dev@lists.linbit.com
X-Greylist: delayed 407 seconds by postgrey-1.31 at mail19;
	Fri, 18 Oct 2019 17:43:43 CEST
Received: from smtprelay.hostedemail.com (smtprelay0149.hostedemail.com
	[216.40.44.149])
	by mail19.linbit.com (LINBIT Mail Daemon) with ESMTP id 8036F42033D
	for <drbd-dev@lists.linbit.com>; Fri, 18 Oct 2019 17:43:43 +0200 (CEST)
Received: from smtprelay.hostedemail.com (10.5.19.251.rfc1918.com
	[10.5.19.251])
	by smtpgrave02.hostedemail.com (Postfix) with ESMTP id 3B1B518113653
	for <drbd-dev@lists.linbit.com>; Fri, 18 Oct 2019 15:36:57 +0000 (UTC)
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net
	[216.40.38.60])
	by smtprelay03.hostedemail.com (Postfix) with ESMTP id BE2168384361;
	Fri, 18 Oct 2019 15:36:25 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Spam-Summary: 2,
X-HE-Tag: dolls48_8e237410aa840
X-Filterd-Recvd-Size: 3702
Received: from XPS-9350.home (unknown [47.151.135.224])
	(Authenticated sender: joe@perches.com)
	by omf15.hostedemail.com (Postfix) with ESMTPA;
	Fri, 18 Oct 2019 15:36:16 +0000 (UTC)
Message-ID: <86695bdf8e8e7425b680dcbcb23acec5e58853da.camel@perches.com>
From: Joe Perches <joe@perches.com>
To: Christoph Hellwig <hch@lst.de>, Petr Mladek <pmladek@suse.com>, Stephen
	Rothwell <sfr@canb.auug.org.au>
Date: Fri, 18 Oct 2019 08:36:15 -0700
In-Reply-To: <20191018152226.GA32150@lst.de>
References: <20191018031710.41052-1-wangkefeng.wang@huawei.com>
	<20191018142626.vmbgclelw23h5pdn@pathway.suse.cz>
	<20191018152226.GA32150@lst.de>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 13 Dec 2019 08:31:26 +0100
Cc: Lars@linbit.com, Mark Rutland <mark.rutland@arm.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>, Ingo@linbit.com,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Herrenschmidt <benh@kernel.crashing.org>,
	Palmer Dabbelt <palmer@sifive.com>, Corentin@linbit.com,
	Jaroslav Kysela <perex@perex.cz>,
	David Howells <dhowells@redhat.com>, Felker <dalias@libc.org>,
	Andy@linbit.com, Rich@linbit.com, "H. Peter Anvin" <hpa@zytor.com>,
	Philipp Reisner <philipp.reisner@linbit.com>,
	Frank Rowand <frowand.list@gmail.com>, linux-afs@lists.infradead.org,
	drbd-dev@lists.linbit.com, Benjamin@linbit.com,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Borkmann <daniel@iogearbox.net>, Jiri Olsa <jolsa@redhat.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Zijlstra <peterz@infradead.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>,
	Darren Hart <dvhart@infradead.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
	Song Liu <songliubraving@fb.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Robert Richter <rric@kernel.org>, Will Deacon <will@kernel.org>,
	Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Rob Herring <robh+dt@kernel.org>, Borislav Petkov <bp@alien8.de>,
	Ellenberg <lars.ellenberg@linbit.com>, linux-fbdev@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Whitcroft <apw@canonical.com>, Takashi Iwai <tiwai@suse.com>,
	bpf@vger.kernel.org, Axboe <axboe@kernel.dk>,
	Karsten Keil <isdn@linux-pingi.de>, Tony Luck <tony.luck@intel.com>,
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Sangbeom Kim <sbkim73@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>, Jens@linbit.com,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>,
	linux-kernel@vger.kernel.org, Martin KaFai Lau <kafai@fb.com>,
	Yonghong Song <yhs@fb.com>,
	Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
	James Morse <james.morse@arm.com>, Chary <corentin.chary@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, Peter@linbit.com,
	linuxppc-dev@lists.ozlabs.org,
	"David S.  Miller" <davem@davemloft.net>,
	Andy Shevchenko <andy@infradead.org>
Subject: Re: [Drbd-dev] [PATCH v2 00/33] Kill pr_warning in the whole linux
	code
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: drbd-dev-bounces@lists.linbit.com
Errors-To: drbd-dev-bounces@lists.linbit.com

(Adding Stephen Rothwell)

On Fri, 2019-10-18 at 17:22 +0200, Christoph Hellwig wrote:
> As I said before: please just send Linus a scripted conversion after
> the next -rc1.  There is no point in creating all this churn.	

I again ask for a scripted mechanism to be added to
-next to allow these types of scriptable patches to get
compilation coverage testing.


_______________________________________________
drbd-dev mailing list
drbd-dev@lists.linbit.com
https://lists.linbit.com/mailman/listinfo/drbd-dev
