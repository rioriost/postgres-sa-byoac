# コパイロットを実装する

??? question "独自のデータを使用しますか？"

    ソリューションアクセラレータに独自のデータを組み込むには、既存のアーキテクチャを特定のデータ構造に合わせて適応させる必要があります。
    以下は推奨事項です：

    **1. ソリューションにデザインパターンとLangChainを実装する**
    AI機能を効果的に統合するには、データとAIモデルの間でシームレスなやり取りを促進するデザインパターンを組み込む必要があります。[LangChain](https://python.langchain.com/docs/introduction/)を利用することで、これらのパターンを構築し、効率的なデータ処理とAIオーケストレーションを可能にします。

    **2. `chat_functions.py`ファイルをカスタマイズする**
    `chat_functions.py`ファイルは、ユーザー入力とAI応答の間の橋渡しをします。これをあなたのデータに合わせるには：

    - 既存の構造を理解する：現在の実装を確認し、データの流れと機能の構造を理解します。
    - データをマッピングする：あなたのデータスキーマが既存の機能とどのように一致するかを特定します。
    - 関数を修正する：AIサービスがデータセットに基づいて正確に解釈し応答できるように、データを適切にクエリし処理するために関数を調整または書き直します。

このセクションでは、Python、Azure Database for PostgreSQL - Flexible ServerのGenAI機能、およびAzure AI拡張機能を使用して、_Woodgrove Bank Contract Management_アプリケーションにAIコパイロットを追加します。AIで検証されたデータを使用して、コパイロットはRAGを使用してベンダー契約のパフォーマンスと請求書の正確性に関する洞察を提供し、Woodgrove Bankのユーザーにとってインテリジェントなアシスタントとして機能します。以下のことを達成します：

- [ ] APIコードベースを探索する
- [ ] RAGデザインをレビューする
- [ ] LangChainオーケストレーションを活用する
- [ ] チャットエンドポイントを実装しテストする
- [ ] 標準的なプロンプトエンジニアリング技術を使用してコパイロットプロンプトを洗練する
- [ ] コパイロットチャットUIコンポーネントを追加しテストする

これらのステップに従うことで、アプリケーションを強力なAI強化プラットフォームに変え、高度な生成AIタスクを実行し、データからより深い洞察を提供できるようになります。

## コパイロットとは何ですか？

コパイロットは、人間の能力を拡張し、生産性を向上させるために設計された高度なAIアシスタントです。これにより、インテリジェントでコンテキストに応じたサポートを提供し、反復的なタスクを自動化し、意思決定プロセスを強化します。例えば、Woodgrove Bankのコパイロットはデータ分析を支援し、ユーザーが金融データセットのパターンやトレンドを特定するのを助けます。

## なぜPythonを使用するのか？

Pythonのシンプルさと可読性は、AIや機械学習プロジェクトにおいて人気のあるプログラミング言語です。LangChainやFastAPIなどの豊富なライブラリやフレームワークは、高度なコパイロットを開発するための強力なツールを提供します。Pythonの多様性は、開発者が迅速に反復し実験することを可能にし、AIアプリケーションを構築するための最良の選択肢となっています。
